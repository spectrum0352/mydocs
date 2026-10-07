# Enable TLS 1.2 on webapp hosted on Azure VM

Let us say we have web app hosted on windows servers in Azure VM, we want any communication happens on that web application from internet or on-premises must be on TLS1.2 how to ensure that it communicates only on TLS 1.2 version?

Ensuring TLS 1.2 Communication for Your Azure Web App

**Understanding the Challenge:** To enforce TLS 1.2 communication for your web app hosted on Azure VMs, you'll need to configure both the server and client-side environments to prioritize and, ideally, exclusively support TLS 1.2.

## Server-Side Configuration (Azure VM)

### 1. Operating System Level

- **Windows Server:**\
        - Ensure the operating system is patched with the latest updates to include TLS 1.2 support.\
        - Use the regedit tool to modify registry settings for TLS protocol preferences. Refer to Microsoft documentation for specific registry keys and values.\
        - Consider using group policies to manage these settings centrally.

- **.NET Framework:** \
        - If using .NET Framework, adjust the ServicePointManager.SecurityProtocol property in your application code to prioritize TLS 1.2.
        - Example: ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 \| SecurityProtocolType.Tls11 \| SecurityProtocolType.Tls;

### 2. **Web Server Configuration:**

- **IIS:**\
        - Configure IIS to require TLS 1.2 and disable older protocols. This can be done through the IIS Manager interface or using PowerShell cmdlets.\
        - Ensure the SSL certificate supports TLS 1.2.

### 3. **Application Level:**\
    - Review your application code and libraries for any hardcoded TLS protocol preferences. Ensure they are aligned with TLS 1.2.

## Client-Side Configuration

### 1. **Browser Settings:**

- Encourage users to update their browsers to the latest versions, which typically support TLS 1.2 by default.
- Some browsers might require specific settings to be enabled.

### 2. **Application Clients:**

- If your application has custom clients (e.g., desktop applications, mobile apps), ensure they are configured to support TLS 1.2. This might involve code changes or updates to libraries.

## Additional Considerations

- **Testing:** Thoroughly test your web application with different browsers, operating systems, and clients to ensure compatibility and security.
- **Monitoring:** Implement monitoring to detect and address any issues related to TLS 1.2 enforcement.
- **Azure App Service:** If you are using Azure App Service, it often provides built-in options to configure minimum TLS version.
- **Load Balancers:** If using Azure Load Balancers, ensure they are configured to support TLS 1.2.
- **Certificate Management:** Use strong, up-to-date SSL certificates that support TLS 1.2.
