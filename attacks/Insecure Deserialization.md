Insecure Deserialization

Deserializing untrusted data leads to code execution, DoS, or data
tampering.
Azure Context:  
Applicable to Azure-hosted apps or services that deserialize objects
(e.g., custom APIs).
Mitigation:
Validate and whitelist allowed data types before deserialization.
Use serialization libraries with built-in security features
(sandboxing, integrity checks).
Monitor application logs with Azure Monitor for unusual behavior.