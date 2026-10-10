security testing

**Q: What is the difference between Penetration Testing and Security Testing?**

* **Security Testing:** A broad verification discipline designed to assess whether security requirements, policies, and safeguards (firewalls, patching, access controls) are implemented and configured correctly. It is often non-intrusive.
* **Penetration Testing:** A focused, goal-oriented, and intrusive assessment where an authorized tester actively exploits discovered vulnerabilities to demonstrate real-world risk, access paths, and data compromise.



\*\*Q: What are the main differences between testing Mobile Applications, Web Applications, and APIs?\*\*



\* \*\*Web Applications:\*\* Focuses on server-side logic, session handling, DOM manipulation, client-side input validation, and browser-enforced policies (CORS, CSP, cookies).

\* \*\*Mobile Applications:\*\* Requires inspecting client-side binary protections (jailbreak/root detection, code obfuscation, reverse engineering via Frida/Ghidra), secure local storage (Keychain/Keystore), and transport security (certificate pinning).

\* \*\*APIs:\*\* Lacks a standard GUI; focuses on broken object-level authorization (BOLA/IDOR), excessive data exposure, mass assignment, rate-limiting, and REST/GraphQL-specific vulnerabilities.



