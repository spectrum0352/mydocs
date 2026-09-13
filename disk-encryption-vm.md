# SSE with CMK in Azure Key Vault maps to *Tier 1 - Most Secure*.

**Where does SSE (Server-Side Encryption) with CMK fit?**

**✅ Tier Mapping**

| **Encryption Model** | **Key Ownership** | **Tier** |
|----|----|----|
| **SSE with CMK (Key Vault / Managed HSM)** | Customer-managed | **Tier 1 – Most Secure** |
| SSE with Platform-Managed Keys (PMK) | Microsoft-managed | Tier 2 – Secure |
| No encryption / default only | N/A | Tier 3 – Basic |

Why SSE + CMK = Tier 1?

SSE with CMK satisfies **Tier 1 security intent** because it provides:

- **Customer-controlled encryption keys**

- **Key lifecycle governance** (rotation, disable, revoke)

- **Separation of duties** (Microsoft manages storage, customer controls keys)

- **Regulatory compliance alignment**:

  - PCI DSS

  - RBI / SOX

  - HIPAA

  - GDPR

- **Cryptographic key isolation** via:

  - Azure Key Vault or Managed HSM

  - Private Endpoint access (Tier 1 requirement)

From a control perspective, **SSE+CMK delivers the same compliance outcome as ADE+CMK** for data-at-rest protection, but with **less operational overhead**.

**Tier 1 Encryption Control (Recommended Wording)**

For your design pattern, use this **explicit Tier 1 statement**:

**Tier 1 – Most Secure:**\
All OS and data disks **must use Server-Side Encryption (SSE) with Customer-Managed Keys (CMK)** stored in **Azure Key Vault or Managed HSM**, accessed via **Private Endpoint**.\
ADE may be used where OS-level encryption is explicitly required.

**Important Design Clarification (Audit-Safe)**

| **Aspect**             | **ADE + CMK** | **SSE + CMK**       |
|------------------------|---------------|---------------------|
| Encryption Layer       | Guest OS      | Azure Storage layer |
| Key Control            | Customer      | Customer            |
| Compliance Acceptance  | High          | High                |
| Operational Complexity | Higher        | Lower               |
| Tier Eligibility       | Tier 1        | **Tier 1**          |

Final Verdict

✅ **SSE with CMK in Key Vault is Tier 1 – Most Secure**\
❌ It is **not Tier 2**, as long as:

- CMK is customer-managed

- Key Vault is locked down (Private Endpoint + RBAC)

- Keys are not platform-managed

If you want, I can **update the unified table wording** to explicitly list **“SSE + CMK (Preferred)” vs “ADE + CMK (Optional)”** for Tier 1.
