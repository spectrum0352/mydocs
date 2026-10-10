Firmware Vulnerabilities
Attack:  
Exploitation of BIOS, UEFI, or device firmware to gain persistence or
bypass security controls.  
Azure Context:  
Firmware attacks are more applicable to on-prem or physical devices but
relevant in hybrid scenarios or if customers manage hardware (e.g.,
Azure Stack).  
Solution:
Use Azure Trusted Launch and Secure Boot on VMs.
Keep host and device firmware updated in hybrid setups.
Enforce device health attestation for connected devices.