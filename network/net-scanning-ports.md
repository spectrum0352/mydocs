# Azure Insecure Interfaces & APIs - Automation Scripts

The following scripts automate common reconnaissance activities during **authorized Azure security assessments**. Ensure you have **written authorization** before running these scripts against any target.

---

## 1. Scan for Open Ports on Azure-Hosted Services

Uses **cloudhunter.py** to identify exposed network services.

**File:** `azure_port_scan.sh`

```bash
#!/usr/bin/env bash

set -euo pipefail

TARGET="${1:-}"

if [[ -z "$TARGET" ]]; then
    echo "Usage: $0 <https://target-url>"
    exit 1
fi

python3 cloudhunter.py \
    --write-test \
    --open-only \
    "$TARGET"
```

### Usage

```bash
chmod +x azure_port_scan.sh

./azure_port_scan.sh https://myapp.azurewebsites.net
```

---

## 2. Azure Subdomain & Endpoint Enumeration

Uses **cf enum** to enumerate Azure-related subdomains and endpoints.

**File:** `azure_cf_enum.sh`

```bash
#!/usr/bin/env bash

set -euo pipefail

DOMAIN="${1:-}"

if [[ -z "$DOMAIN" ]]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

OUTPUT="${DOMAIN}_cf_enum.txt"

cf enum "$DOMAIN" > "$OUTPUT"

echo "[+] Enumeration completed."
echo "[+] Results saved to: $OUTPUT"
```

### Usage

```bash
chmod +x azure_cf_enum.sh

./azure_cf_enum.sh contoso.com
```

---

## 3. Azure API Endpoint Fuzzing

Uses **ffuf** to discover hidden or undocumented API endpoints.

**File:** `azure_api_fuzzer.sh`

```bash
#!/usr/bin/env bash

set -euo pipefail

TARGET="${1:-}"
WORDLIST="/usr/share/seclists/Discovery/Web-Content/api.txt"
OUTPUT="ffuf_api_results.json"

if [[ -z "$TARGET" ]]; then
    echo "Usage: $0 <https://target-api>"
    exit 1
fi

if [[ ! -f "$WORDLIST" ]]; then
    echo "[-] Wordlist not found: $WORDLIST"
    exit 1
fi

ffuf \
    -w "$WORDLIST" \
    -u "${TARGET}/FUZZ" \
    -mc all \
    -o "$OUTPUT"

echo "[+] API fuzzing completed."
echo "[+] Results saved to: $OUTPUT"
```

### Usage

```bash
chmod +x azure_api_fuzzer.sh

./azure_api_fuzzer.sh https://api.contoso.com
```

---

## 4. Enumerate Public Azure Blob Containers

Attempts to identify publicly accessible Azure Blob Storage containers using a supplied wordlist.

**File:** `azure_blob_enum.py`

```python
#!/usr/bin/env python3

import sys
import requests

if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} <storage-account> <container-wordlist>")
    sys.exit(1)

account_name = sys.argv[1]
wordlist = sys.argv[2]

with open(wordlist, "r", encoding="utf-8") as f:
    for container in f:
        container = container.strip()

        if not container:
            continue

        url = (
            f"https://{account_name}.blob.core.windows.net/"
            f"{container}?restype=container&comp=list"
        )

        try:
            response = requests.get(url, timeout=10)

            if response.status_code == 200:
                print(f"[+] Public container found: {container}")

        except requests.RequestException:
            pass
```

### Usage

```bash
python3 azure_blob_enum.py contoso containers.txt
```

Example `containers.txt`

```text
public
backup
logs
images
uploads
static
```

---

## Prerequisites

- Python 3
- `requests` Python package
- `ffuf`
- `cloudhunter.py`
- `cf` (Cloudflare enumeration tool)
- Appropriate wordlists (e.g., SecLists)

Install Python dependency:

```bash
pip3 install requests
```