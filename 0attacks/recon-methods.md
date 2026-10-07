# Recon Methods

### Recon through Search Engines 
Penetration Testing of Microsoft Azure: Reconnaissance Using Search Engines

What is Reconnaissance?
Reconnaissance is the first step attackers take to gather information about a target before launching an attack.

How Attackers Use Search Engines:
•	Attackers use search engines (like Google) to find details about a target, such as:
o	What technology platforms they use
o	Employee names and roles
o	Login pages and internal portals
•	This information helps attackers plan social engineering attacks or more advanced system attacks.
•	Attackers use special search techniques called advanced search operators to create detailed queries. This helps them find specific information faster and more accurately.
•	Search engines can also help find other publicly available sources of information, like job portals or company websites.

Advanced Google Hacking (Footprinting):
•	This means using complex Google search commands to find hidden or sensitive information about a target.
•	Common Google search operators used include:
o	cache: Shows stored versions of web pages saved by Google
o	link: Finds pages that link to a specific webpage
o	related: Shows pages similar to a given webpage
o	info: Provides information Google has about a webpage
o	site: Limits search results to a specific website or domain
o	allintitle: Finds pages with all keywords in the page title
o	intitle: Finds pages with a specific keyword in the title
o	allinurl: Finds pages with all keywords in the URL
o	inurl: Finds pages with a specific keyword in the URL
o	location: Finds information related to a specific geographic location


Footprinting via Search Engines
Attackers use popular search engines like Google, Bing, and DuckDuckGo to gather public information about a target. 

This can include:
Technologies used by the organization (e.g., Azure, Apache, Office 365)
Employee names and roles
Login pages and portals (e.g., intranet, admin panels)
Sensitive files or documents accidentally exposed
Job postings that reveal tech stacks or internal tools

This information helps in social engineering, identifying attack surfaces, and launching targeted attacks.

Google Dorking
Attackers use Google Dorking (Google Hacking) to craft advanced queries that expose sensitive or hidden data.

Common Google Search Operators:

Operator	Function
cache:	Shows a cached version of a web page
link:	Lists pages that link to a specific page
related:	Shows pages similar to a specific page
info:	Displays summary info about a site
site:	Limits search results to a specific domain
allintitle:	Finds pages with all keywords in the title
intitle:	Finds pages with specific keywords in the title
allinurl:	Finds URLs containing all keywords
inurl:	Finds URLs containing specific keywords
location:	Filters content based on location (limited use)

Example:
site:azurewebsites.net intitle:"index of" password

This query searches Azure-hosted sites that may expose directory listings with passwords.




### Recon through WHOIS database
Whois lookup tools-Smart Whois tool
Footprinting through WHOIS
Attackers use WHOIS databases to gather registration information about domains.

Information obtained:
Domain name and registrar details
Owner's name, phone number, and email
Name servers used
IP ranges (NetRange)
Domain creation and expiration dates
Last update record
DNS info for enumeration

This data can be used for phishing, social engineering, or infrastructure mapping.




### Recon through Web Services 

### Recon through Social Engineering
Social engineering techniques are used to extract confidential information from employees or systems by deception rather than technical methods.

Examples include:
•	Posing as a tech support agent to request internal login details
•	Calling employees to gather organizational structure
•	Sending phishing emails to collect credentials
•	Monitoring social media (LinkedIn, Twitter) for leaked internal information


### Recon through Social Media

What is Reconnaissance?
Reconnaissance (or recon) is the first step in a cybersecurity attack. It means gathering information about a target before trying to break into their systems. The more details attackers collect, the better they can plan their attack.

How does Reconnaissance work on Microsoft Azure using social media?
Microsoft Azure is a cloud platform used by many companies to host their applications and data. Attackers want to find weaknesses in Azure setups, and social media is one place they look for clues.

Here’s how attackers use social media for Azure reconnaissance:
1.	Finding Employees and Roles:
Attackers search platforms like LinkedIn to find people who work at a company using Azure. They look at job titles such as “Cloud Engineer,” “Azure Administrator,” or “IT Manager.” This helps attackers identify who might have access to the company’s Azure environment.
2.	Gathering Personal Information:
By viewing employee profiles, attackers can learn about their skills, projects, and sometimes even tools or technologies they use in Azure. Sometimes employees share screenshots, code snippets, or other info by mistake.
3.	Collecting Email Addresses and Contacts:
LinkedIn and other sites often show employee emails or allow attackers to guess their email formats. This helps attackers send targeted phishing emails pretending to be from inside the company or Microsoft Azure support.
4.	Identifying Technology and Infrastructure:
Employees may share details about their cloud infrastructure, like which Azure services they use (Azure VMs, Azure SQL, etc.). This gives attackers clues about where to focus their hacking efforts.
5.	Understanding Company Structure:
social media can reveal the company’s hierarchy and how teams are organized, helping attackers impersonate staff or create convincing social engineering attacks.

Why is this dangerous?
Even if attackers can’t directly hack into Azure through social media, the information they collect makes their attacks much more effective and dangerous. For example, a phishing email based on real employee info is more likely to trick someone.


How to Protect Against This?
•	Limit what employees share online: Avoid posting sensitive details about your company’s Azure setup or internal projects.
•	Use privacy settings: Encourage employees to keep profiles visible only to trusted contacts.
•	Educate employees: Train them to recognize phishing attempts and avoid sharing confidential info.
•	Verify contacts carefully: Always confirm requests for sensitive information, especially if they come via email or social media.



Examples of Social Media Reconnaissance Risks and Prevention
•	Job Title Leakage: An attacker finds a LinkedIn profile listing “Azure Cloud Administrator” and emails them a phishing message pretending to be from Microsoft support.
Prevention: The employee recognizes the phishing attempt because of training and reports it.
•	Oversharing Project Details: An employee posts about a new Azure SQL database project on Facebook. An attacker uses this info to target the company’s database servers.
Prevention: The company enforces a social media policy to avoid posting sensitive project information.
•	Public Email Exposure: Email addresses on public profiles are used by attackers to send spear-phishing campaigns.
Prevention: Employees hide their email addresses or use company aliases instead of personal emails.




### Recon through closed sources databases
1.	Reconnaissance (Information Gathering):
Before starting the actual testing, we collect as much information as possible about the target Azure environment. This includes using private or restricted databases, called closed source databases, which are not publicly available. These sources might have detailed information about Azure services, configurations, or known vulnerabilities that help testers prepare their attack plans.
2.	Scanning and Enumeration:
After gathering information, testers scan the environment to identify active services, open ports, and potential weak points.
3.	Exploitation:
Using the gathered data, testers try to exploit vulnerabilities to gain access or control over Azure resources.
4.	Post-Exploitation:
Once inside, testers explore how far they can move within the Azure environment, check for sensitive data, and assess the impact.
5.	Reporting:
Finally, all findings are documented clearly, with recommendations on how to fix or improve security.


Search engines


Penetration Testing Reconnaissance: Using Search Engines for Websites, Web Apps, and Azure App Services

What Information to Gather via Search Engines
•	Website Footprinting:
o	Technologies used: software versions, frameworks, scripting languages (e.g., PHP, ASP.NET)
o	Web server operating system and server software/version
o	Subdirectories, URL parameters, and file paths
o	Database field names exposed in error messages
o	Contact information and CMS details
•	HTTP Header Details (via browser developer tools or proxies):
o	Connection status, content type
o	Support for resuming downloads (Accept-Ranges header)
o	Last modified dates of website content
o	Server software and version (e.g., revealed by X-Powered-By header)
•	HTML Source Code:
o	Developer comments (may reveal sensitive info)
o	Contact info for admins or developers
o	Clues about directory structure
________________________________________
How to Gather This Information
•	Search Engine Queries:
o	Use Google, Bing, or specialized engines like Shodan and Censys
o	Apply search engine dorking with advanced operators to uncover:
	Indexed files, error messages, config files
	Open ports or services (via Shodan/Censys)
•	Browser Developer Tools and Proxies:
o	Inspect headers and responses with Burp Suite, Firebug, or Chrome DevTools
•	Website Mirroring:
o	Use tools like wget or HTTrack to download full or partial website copies for offline analysis
________________________________________
Limitations of Search Engine Reconnaissance
•	Incomplete Coverage: Dynamic content and unindexed pages may be missed.
•	Outdated Data: Search engine caches might not reflect the latest site changes.
________________________________________
Best Practices
•	Combine search engine reconnaissance with other methods (e.g., subdomain enumeration, crawling, fuzzing) for a thorough assessment.
•	Always conduct reconnaissance ethically and with authorization.



Web Spiders 

What Information to Gather
•	Employee names, email addresses, and other sensitive data exposed on the website
•	Website directory structure and file organization
•	Historical versions of the website and cached content
________________________________________
Where to Gather Information From
•	Publicly accessible website pages
•	Archived versions of the site (Wayback Machine, Google Cache)
•	Downloaded offline copies of the website

How to Gather Information

Technique	Description & Tools
Web Spiders (Crawlers)	Automated tools that systematically crawl websites to extract data like emails, names, and files.
	Popular tools: GSA Email Spider (email extraction), Web Data Extractor (versatile data scraping)
Website Mirroring	Download the entire website for offline examination, revealing structure and hidden content.
	Popular tools: wget (command-line, use -m flag), HTTrack Website Copier (GUI), SurfOffline (GUI)
Historical Content	Use archives to access past website versions or cached copies.
	Resources: Wayback Machine, Google Cache
________________________________________
Important Considerations
•	Web spidering and mirroring can consume significant server resources—always use responsibly and with authorization.
•	Some websites actively block spiders or disallow mirroring via robots.txt or other methods, limiting effectiveness.
•	Use the gathered data ethically, particularly when handling personal or sensitive information.






