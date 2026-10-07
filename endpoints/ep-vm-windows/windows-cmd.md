# **Windows Security & Command Prompt Reference**

### **Command Prompt (CMD) & PowerShell**

#### **Useful Shortcuts**

* **`Ctrl + C`**: Aborts the current command execution.



#### **Wi-Fi Credential Management (CMD)**

* **View saved Wi-Fi profiles:**
```cmd
netsh wlan show profiles

```


*(To view a cleartext password for a specific profile, run: `netsh wlan show profile name="PROFILE_NAME" key=clear`)*
* **Delete a Wi-Fi profile:**
```cmd
netsh wlan delete profile name="Network2121-Name"
```[cite: 2]


```



#### **PowerShell Configuration**

* **Enable script execution for the current user:**
```powershell
Set-ExecutionPolicy -Scope "CurrentUser" -ExecutionPolicy "RemoteSigned"
```[cite: 2]


```



---

### **Windows 10/11 Security Features**

#### **1. Windows Hello**

* Provides fast, passwordless authentication using biometrics (facial recognition, fingerprint) or a PIN to log into devices.



#### **2. Microsoft Defender Credential Guard**

* **Mechanism:** Uses Virtualization-Based Security (VBS) to isolate sensitive secrets so that only privileged system software can access them.


* **Protection Scope:** Prevents unauthorized credential theft attacks—such as Pass-the-Hash (PtH) and Pass-the-Ticket (PtT)—by protecting NTLM password hashes, Kerberos Ticket Granting Tickets (TGTs), and domain credentials stored by applications.



#### **3. Microsoft Defender Application Guard**

* **Mechanism:** Isolates enterprise-defined untrusted websites inside a separate, hardware-bound Hyper-V container away from the host operating system.


* **Protection Scope:** If an employee visits a malicious site via Microsoft Edge or Internet Explorer, the container isolates the threat, preventing attackers from accessing host enterprise data or compromising the main OS.



#### **4. Windows Defender Device Guard**

* **Mechanism:** Hardens system integrity by enforcing strict code integrity policies.


* **Protection Scope:** Prevents malicious code from executing by ensuring only known, trusted, and signed code is permitted to run on the system.



#### **5. Microsoft Defender Antivirus**

Delivers comprehensive, real-time protection against software threats across email, applications, the cloud, and the web through:

* **Cloud-Delivered Protection:** Enables near-instant detection and blocking of new and emerging zero-day threats.


* **Behavioral Monitoring & Heuristics:** Always-on scanning using advanced file and process behavior analysis to detect anomalous activity.


* **Dedicated Threat Intelligence Updates:** Continuous updates driven by machine learning, automated big-data analysis, human threat research, and in-depth vulnerability intelligence.