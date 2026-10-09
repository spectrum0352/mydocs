# Proxy feature in Azure Firewall

The **explicit proxy** feature on a firewall refers to a configuration where **client devices are explicitly told to forward their web traffic to a proxy server (in this case, the firewall itself)** for processing, rather than sending it directly to the internet.

**What is a proxy?**

A **proxy** sits between a client (like a web browser) and the internet. It receives client requests, processes them, and forwards them to the destination. It can inspect, filter, cache, and log the traffic.

**Explicit Proxy means:**

* The **client knows about the proxy** and is configured to send traffic to it.
* Commonly used in **web proxy (HTTP/HTTPS) scenarios**.
* You **manually configure** browser settings (or use a PAC file / GPO / WPAD) to route traffic to the firewall proxy.

**Benefits:**

* **Better visibility and control** over user internet activity.
* Can enforce **URL filtering, malware scanning**, SSL inspection, etc.
* Can apply **user- or group-based policies** if integrated with authentication.
* Useful in **BYOD or guest networks** where you want to control traffic without deploying agents.

**Contrast with Transparent Proxy:**

|**Feature**|**Explicit Proxy**|**Transparent Proxy**|
|-|-|-|
|Client Configuration|Required|Not required|
|Application Awareness|Client knows it's a proxy|Client thinks it talks to destination|
|Flexibility|More granular control|Easier to deploy|

The **Azure Firewall Explicit Proxy** feature allows you to configure **Azure Firewall** as an explicit web proxy for outbound internet traffic. This means that instead of relying on transparent (implicit) routing, client devices or applications are explicitly configured to send their web (HTTP/HTTPS) traffic to Azure Firewall for inspection and filtering.

**🔍 What is Explicit Proxy?**

An **explicit proxy** requires the client (e.g., browser or system) to be configured to use a specific proxy server (in this case, Azure Firewall). This is different from a **transparent proxy**, where the traffic is redirected to the proxy without the client knowing.

**💡 Key Features of Azure Firewall Explicit Proxy**

1. **Proxy-aware routing**:

   * Clients (e.g., browsers, OS settings, PAC files) are configured to send their internet-bound HTTP/S traffic directly to the Azure Firewall IP.
2. **Full URL inspection**:

   * Supports URL-based rules for both HTTP and HTTPS traffic.
   * Enables fine-grained access control policies (e.g., block social media, allow only specific sites).
3. **Authentication support**:

   * Can integrate with **Azure Active Directory (AAD)** for user-based policies using Azure Firewall Premium and Identity-based rules.
4. **TLS Termination and Inspection**:

   * With Azure Firewall Premium, HTTPS traffic can be decrypted, inspected, and re-encrypted.
5. **Logging and monitoring**:

   * All traffic going through the proxy is logged via Azure Monitor and can be exported to Log Analytics, Event Hubs, or Storage accounts.
6. **Simplified routing**:

   * No need for UDRs or redirect rules when clients are configured with proxy settings.

**📦 How to Configure It**

1. **Enable Explicit Proxy Mode**:

   * In the Azure Firewall configuration, enable the **Explicit Proxy** setting.
2. **Configure Clients**:

   * Use **Proxy Auto-Configuration (PAC) files**, Group Policy, or manual settings to point clients to the Azure Firewall private IP on port **3128** (default for explicit proxy).
3. **Define Application Rules**:

   * Set up rules in the firewall to control access based on URLs, categories (Premium), and user identity (optional).

**✅ When to Use It**

* You want **fine-grained web filtering** without relying solely on network-level rules.
* You need **per-user internet access control** using Azure AD.
* You want centralized control and monitoring for internet-bound traffic from clients in Azure or hybrid environments.

**📝 Example Use Case**

Imagine a scenario where you have Windows 11 devices in Azure Virtual Desktop (AVD), and you want to:

* Allow only specific websites (e.g., company domains)
* Block social media
* Monitor user activity
* Apply different rules based on user identity

With Azure Firewall Explicit Proxy, you can do all of this efficiently.

Let me know if you'd like a visual diagram or specific configuration steps!



