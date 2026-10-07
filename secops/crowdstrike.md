 

**Falcon Sensor:**

The CrowdStrike Falcon Sensor communicates with the CrowdStrike console
using TLS 1.2 or later port 443

 

CrowdStrike Falcon Sensor requires outbound traffic to be added to the
allowlist for:

US-1 environments:

- ts01-b.cloudsink.net

- lfodown01-b.cloudsink.net

- lfoup01-b.cloudsink.net

- [<u>https://falcon.crowdstrike.com</u>](https://falcon.crowdstrike.com)

- [<u>https://assets.falcon.crowdstrike.com</u>](https://assets.falcon.crowdstrike.com)

- [<u>https://assets-public.falcon.crowdstrike.com</u>](https://assets-public.falcon.crowdstrike.com)

- [<u>https://api.crowdstrike.com</u>](https://api.crowdstrike.com)

- [<u>https://firehose.crowdstrike.com</u>](https://firehose.crowdstrike.com)

 

**Console Access URLs**

- US-1:
  [<u>https://falcon.crowdstrike.com</u>](https://falcon.crowdstrike.com)

- US 2:
  [<u>https://falcon.us-2.crowdstrike.com</u>](https://falcon.us-2.crowdstrike.com)

- US-GOV-1:
  [<u>https://falcon.laggar.gcw.crowdstrike.com</u>](https://falcon.laggar.gcw.crowdstrike.com)

- US-GOV-2:
  [<u>https://falcon.us-gov-2.crowdstrike.com</u>](https://falcon.us-gov-2.crowdstrike.com)

- EU-1:
  [<u>https://falcon.eu-1.crowdstrike.com</u>](https://falcon.eu-1.crowdstrike.com)

 

 

**General Requirements to install Falcon Sensor:**

- Local Administration rights for installation

- Proxy Connections: CrowdStrike Falcon Sensor supports proxy
  connections:

  - Auto-Proxy Discovery

  - Automatic proxy configuration (Pac URL)

  - Static web proxy (HTTP)

 

 

**How to Identify the CrowdStrike Falcon Sensor Version**

Knowing the CrowdStrike Falcon Sensor version allows you to:

Identify known issues

Understand process changes

Understand system requirements

 

- On Windows: Open Command Prompt: In Command Prompt, type "C:\Program
  Files\CrowdStrike\CSSensorSettings.exe" –version and then press Enter.

- On Linux: In Terminal, type sudo /opt/CrowdStrike/falconctl -g
  --version and then press Enter.

 

--------------------------------------------------------------------------------------------------------------------

**Here are some potential interview questions related to CrowdStrike
Falcon EDR:**

 

**General Concepts:**

 

Explain the core functionalities of CrowdStrike Falcon EDR.

What are the key advantages of Falcon EDR over traditional antivirus
solutions?

How does Falcon EDR leverage the cloud for detection and response?

Describe the different detection methods used by Falcon EDR (e.g.,
behavioural analysis, signature-based detection).

Differentiate between Falcon Prevent and Falcon Insight.

 

 

Technical Deep Dive:

 

Explain the process of isolating and investigating a suspicious file
with Falcon EDR.

How does Falcon EDR handle threat hunting activities?

Describe the Falcon Response module and its functionalities.

How does Falcon EDR integrate with other security tools in an
environment?

Discuss the Falcon XDR platform and its benefits over standalone EDR.

 

 

Advanced:

 

Explain the role of Threat Graph in Falcon EDR and its benefits for
threat hunting.

Discuss the limitations of Falcon EDR and potential mitigation
strategies.

Compare and contrast Falcon EDR with other leading EDR solutions like
McAfee Endpoint Security or Carbon Black EDR.

Share your thoughts on the future of EDR solutions and how Falcon EDR
might evolve.

You are tasked with presenting Falcon EDR to a non-technical audience.
How would you explain its value proposition in simple terms?

 

Bonus:

Show your understanding of recent CrowdStrike announcements or updates
related to Falcon EDR.

Be prepared to discuss specific use cases relevant to the role you are
applying for.

Demonstrate your passion for cybersecurity and continuous learning in
the field.

 

 

What is difference between EDR and XDR?

| Feature | EDR | XDR |
|----|----|----|
| Scope | Endpoints | Endpoints, networks, cloud environments, and security tools |
| Data sources | Endpoint logs and events | Endpoint logs and events, network traffic, cloud logs, and security tool alerts |
| Capabilities | Anomaly detection, threat hunting, incident response | Unified visibility, threat hunting, automated response |

 

 

 

# Install CS agent on Windows

<https://adamtheautomator.com/crowdstrike-falcon-sensor/>

Lightweight agent called the Crowdstrike Falcon Sensor.

>  

**Deploying the Crowdstrike Falcon Sensor for Windows using PowerShell &
Group Policy**

>  
>
> **Prerequisites:**

- Free Trial: <https://go.crowdstrike.com/try-falcon-prevent.html>

- Use Customer Identifier (CID) to complete this guide.

- Access to an Active Directory Domain Admin account, which is required
  for editing and managing Group Policy.

- Have the Remote Server Administration Tools (RSAT) software package
  installed on a domain-joined computer. Alternatively you can access
  Group Policy Management from a Active Directory Domain Controller as
  well.
  <https://adamtheautomator.com/powershell-import-active-directory/>

- A file share to host the Crowdstrike Falcon Sensor executable where
  machines can access. This tutorial will use the
  path [\\*srv1\Installers*](file:///\\srv1\Installers).

- At least one domain-joined Windows 7+ computer to deploy the
  Crowdstrike Falcon Sensor to.

>  
>
> **Find Your CID and Downloading the Crowdstrike Falcon Sensor**

- Open up a browser and navigate to the [Sensor Downloads section of the
  Crowdstrike management
  portal](https://falcon.crowdstrike.com/login/?next=%2Fhosts%2Fsensor-downloads) or
  you could alternatively click on the Sensor Downloads item on the
  Falcon dashboard as shown below.

>  
>
> <img src="media/image1.png" style="width:4.6in;height:2.86667in" />
>
>  

- Once on the Sensor Downloads page, you should see a
  <span class="mark">HOW TO INSTALL</span> section shown below. This
  section contains your customer ID. Copy that ID to your clipboard.

>  
>
> <img src="media/image2.png" style="width:5.86531in;height:2.06912in" />
>
>  

- Once downloaded, you should have a file called **WindowsSensor.exe**.
  Now move this file to a network share where all of the computers
  you’ll be installing this on can access.

>  
>
> **Note**: The network share can be any share that has Read-Only
> permissions for users and computers. In practice, these could be
> shares that contain other installation files used across your network.
>
>  
>
> **Create a PowerShell Installation Script**
>
> Script will download the sensor from file share, install and configure
> it.
>
>  
>
> **Note**: You may have to change the PowerShell execution policy to
> run PowerShell scripts. This is something normally controlled by Group
> Policy when PowerShell security settings are centrally managed.
>
>  
>
> Open visual studio code and paste below script. Script will perform
> following functions:

- Create a temporary folder for the download

- Copies the sensor file from the file share to the temporary folder

- Checks if the Falcon Sensor is already running and if not:

- Installs the Falcon Sensor

\# Replace placeholders with actual values

\$sensorFilePath = "\\your_file_share\path\to\sensor.exe"

\$tempFolderPath = "\$env:TEMP\CrowdStrikeSensorInstall"

\$cid = "your_customer_id"

\# Create temporary folder

try {

if (!(Test-Path \$tempFolderPath)) { New-Item -Path \$tempFolderPath
-ItemType Directory \| Out-Null }

}

catch { Write-Error "Failed to create temporary folder:
\$(\$\_.Exception.Message)" }

\# Copy sensor file to temporary folder

try {

\$sensorFileName = Split-Path -Leaf \$sensorFilePath

Copy-Item \$sensorFilePath "\$tempFolderPath\\sensorFileName"

} catch {

Write-Error "Failed to copy sensor file: \$(\$\_.Exception.Message)"

}

\# Check if Falcon Sensor is running

\$falconSensorRunning = Get-Process -Name CSFalconService -ErrorAction
SilentlyContinue

if (!\$falconSensorRunning) {

try {

\# Install Falcon Sensor

Start-Process "\$tempFolderPath\\sensorFileName" -ArgumentList "/install
/quiet /norestart CID=\$cid" -Wait

} catch {

Write-Error "Failed to install Falcon Sensor:
\$(\$\_.Exception.Message)"

}

} else {

Write-Host "Falcon Sensor is already running."

}

\# Clean up temporary folder (optional)

Remove-Item -Path \$tempFolderPath -Recurse -Force

2\. Before saving the script, replace the value defined for the \$CID
variable in the script above with your CID you obtained from the Falcon
dashboard.

3\. Also, replace the UNC share defined above via the \$SensorShare
variable with the location where your WindowsSensor.exe Falcon sensor is
stored such as \\SERVER\Fileshare\WindowsSensor.exe.

4\. Save the script to the same network share ie \\SERVER\Fileshare and
call it Install-Crowdstrike.ps1

You should now have a PowerShell script and WindowsSensor.exe in your
shared network location folder.

**Create a Group Policy Object to Install Crowdstrike Falcon Sensor**

To install the Crowdstrike Falcon Sensor, you need to get it and the
PowerShell script on all of the endpoints. To do that, create a Group
Policy Object (GPO). This GPO will contain instructions to create a
Windows scheduled task that will run the installation script you just
created at a specified time.

If you are unfamiliar with creating a GPO, check out the Microsoft
documentation.

- On your domain-joined machine, open a run prompt and type GPMC.msc and
  click OK. This action will open the Group Policy Management Console.

- Next, right-click Group Policy Objects and select New, as shown below:

<img src="media/image3.png" style="width:6.025in;height:4.275in"
alt="Group Policy Management Console - Creating a new GPO" />

3\. Provide a name for your GPO a meaningful name. In this tutorial, the
GPO is called Deploy Crowdstrike Windows Sensor as shown below:

<img src="media/image4.png" style="width:4.01667in;height:1.875in"
alt="Giving a New GPO a name" />

4\. Click OK to create the GPO.

5\. In the Contents tab, right-click on the GPO you created as shown
below and click on Edit.

<img src="media/image5.png" style="width:6.08181in;height:3.03826in"
alt="Editing the newly created GPO" />

- Navigate to Computer Configuration —\> Preferences —\> Control Panel
  Settings.

- Right-click on Scheduled Tasks and select New —\> Scheduled Task (At
  least Windows 7) as shown below. The New Task configuration screen
  will appear.

<img src="media/image6.png" style="width:6.93791in;height:2.96444in"
alt="Creating a new Scheduled Task for Windows 7 and up" />

**<span class="mark">Set up the Scheduled Task</span>**

Once you have created the GPO template, it is time to create a scheduled
task which will execute the installation script. The Scheduled Task is a
critical part of this process which you can exercise the most control
over the deployment. To get started:

On the New Task screen, begin configuring the scheduled task options by
changing the Action to Replace. This will the GPO will create the
scheduled task every time the GPO refreshes.

2\. Give the scheduled task a name and a short description. This
tutorial’s scheduled task name is Deploy Crowdstrike Falcon for Windows.

**3. Next, adjust a few settings:**

- Under Security options, choose to run the task as NT Authority\System.

- Select Run whether a user is logged on or not to not require a user
  account to interactively log in to kick off the script.

- Check the box to Run with highest privileges ensuring the script runs
  with elevated credentials.

- Change the Configure for menu to be Windows 7, Windows Server 2008R2.

<img src="media/image7.png" style="width:6.92515in;height:5.20139in"
alt="New Task - General configuration tab" />

4\. Click on the Triggers tab. On this tab, you can stipulate when this
task will run. This is an important step as you can decide to run the
installation task later or shortly after you complete the GPO
configuration.

5\. While on the Triggers tab, click New as shown below and the dialog
will disappear.

<img src="media/image8.png" style="width:6.96667in;height:4.71007in"
alt="New Task - Triggers tab - Creating a new trigger" />

6\. Select the time you would like the install to happen. For this
guide, the example is using an established maintenance window of 11 AM
on a Tuesday. You can use a time that works best for you. Begin the task
on a schedule, with the Settings and Advanced Settings you want. Once
satisfied, click OK, as shown below:

<img src="media/image9.png" style="width:6.20833in;height:5.00833in"
alt="New Trigger - Configured" />

**New Trigger –** Configured When using Computer policies, a reboot may
be necessary to create the Scheduled Task. Keep this in mind when
choosing a trigger time.

7\. Now you must add Actions or what to execute when the scheduled task
is triggered. To start, click on the Actions tab as shown below. Here
you will configure the Scheduled Task to run the Install-Crowdstrike.ps1
script.

8\. While on the Actions tab, click New, as shown below. The New Action
dialogue will appear.

<img src="media/image10.png" style="width:7.66667in;height:5.28333in"
alt="New Task - Actions tab - Creating a new action" />

9\. Since you are running a PowerShell script, leave the Action option
at Start a program. The scheduled task will be executing powershell.exe.

10\. Next under Settings, type Powershell.exe.

11\. You now need to provide a few parameters to the powershell.exe
engine. Add the following arguments in the Add arguments(optional) box.
These arguments tell PowerShell not to pay attention to the execution
policy on the client machine and to run the script created earlier from
the network share.

-ExecutionPolicy Bypass -File "\svr1\Installers\Install-Crowdstrike.ps1"

12\. When finished, click OK as shown below:

<img src="media/image11.png" style="width:4.175in;height:4.375in"
alt="New Action - Configured" />

You are now back to the Actions tab. The Scheduled Task configuration is
complete!

Click OK to return to the Group Policy Management Console as shown
below:

<img src="media/image12.png" style="width:7.65in;height:5.325in"
alt="New Task configuration complete" />

You should now see the Scheduled Task listed in the GPO. Congrats! One
more step down.

<img src="media/image13.png" style="width:6.8875in;height:2.34189in"
alt="Configured GPO with Scheduled Task" />

## Link the GPO to an Organizational Unit

The last step is to link the GPO you just created to an OU of your
choice using the Group Policy Management Console. The OU should contain
all of the computers you’d like to install the Crowdstrike Falcon Sensor
on.

To link to an OU, Right-click the OU and choose Link an Existing GPO as
shown below:

<img src="media/image14.png" style="width:5.2in;height:2.34167in"
alt="Linking a GPO" />

2\. The Select GPO dialogue will appear. Choose the GPO you just created
and click OK.

<img src="media/image15.png" style="width:4.675in;height:4.28333in"
alt="Select GPO dialogue" />

3\. You should now see the GPO linked to the GPO. In the following
example, the policy is being applied to the entire kindlelab.local
domain:

<img src="media/image16.png" style="width:4.11667in;height:3.4in"
alt="GPO linked to GPO" />

Applying the GPO

Once the GPO is linked to the target systems’ OU, they need to reboot to
run the GPO and create the scheduled task. To test your implementation,
reboot one of the computers you’ve targeted in the OU. When the computer
comes back up, you should see a new scheduled task created in Task
Scheduler as shown below.

<img src="media/image17.png" style="width:6.68611in;height:1.55585in"
alt="Task Scheduler" />

Verifying Sensor Deployment

Eventually, you’ll see agents installed on all of the target computers
appearing in the Falcon console. Deployed agents appear within five
minutes or less after installation is successful.

There are a couple of ways you can verify the deployment was successful.
The easiest way is to visit the Crowdstrike Falcon console and selecting
**Hosts —\> Hosts Management.**

You can alternatively use PowerShell to enumerate the CSFalconService on
an endpoint using the Get-Service cmdlet as shown below. This command is
querying for the service. If the service shows up and is running, the
Falcon Sensor is installed and operational!

<img src="media/image18.png" style="width:7.22778in;height:1.19928in"
alt="Get-Service cmdlet" />

# Install CS agent on Linux

[<u>https://www.crowdstrike.com/blog/tech-center/install-falcon-sensor-for-linux/</u>](https://www.crowdstrike.com/blog/tech-center/install-falcon-sensor-for-linux/)

 

 

 

# CrowdStrike Blue Screen of Death Issue

There was a recent incident where a faulty update from CrowdStrike
caused a widespread Blue Screen of Death (BSOD) issue on Windows
machines. Here is a breakdown of what happened:

- **Cause:** A defective update deployed by CrowdStrike's Falcon Sensor,
  a security software program for endpoints.

- **Impact:** This update triggered BSOD errors on Windows PCs and
  servers, causing unexpected shutdowns and restarts. This affected
  businesses worldwide, disrupting operations in various sectors like
  airlines, banks, and stock markets.

- **Who was affected:** Only Windows machines were susceptible. Macs and
  Linux systems remained unaffected.

- **Resolving the Issue:** Fixing this issue required manual
  intervention. IT administrators had to boot affected machines into
  safe mode and remove the faulty CrowdStrike driver.

Driver file is severely bugged causing frequent system crashes during
startup. This results in boot loop and requires manual workaround, so
booting in to safe mode and deleting problematic file is a workaround.

Faulty single content update to CS Falcon Sensor triggered compatibility
issues with windows kernel.

**Note:** Serious issue is that we can not push an update. Each machine
requires manual intervention to boot into safe mode and delete the
faulty file.

The Blue Screen of Death errors were triggered by a recent update to
CloudStrike’s Falcon sensor, a component of their endpoint security
software. Many users on Reddit shared that the issue appears to be
related to the “DRIVER_OVERRAN_STACK_BUFFER” error, which prevents your
system from starting up normally and operating.

**How to avoid this situation?**

- Multiple EDR is not an option.

- Use dev, test, and prod. Technically possible but practically
  difficult to implement. This issue is not caused due to Sensor
  updates/upgrades, this was caused due to content deployments from CS
  console to sensor. In that

- Work with Vendor to ensure these are properly tested on all types and
  flavours of Operating systems, and also provide the result of test on
  their support page.

- Use VM backups

- 

1\. Boot Windows into Safe Mode or the Windows Recovery Environment

2\. Turn off the device by holding the power button for 10 seconds.

<https://gadgetstouse.com/blog/2024/07/19/how-to-fix-bsod-due-to-crowdstrike-issue/>

**Q. How Can I Fix the BSOD CrowdStrike Error?**

To fix it, run your PC/laptop in safe mode and go to
C:\Windows\System32\drivers\CrowdStrike directory. Then, locate the
“C-00000291\*.sys” file and delete it. Now, reboot your system normally.

**Q. How Much Has the BSOD Error Impacted Overall?**

The widespread impact has led to significant disruptions, with some
organizations reporting thousands of affected devices, including
critical production servers and SQL nodes. The scope of the issue is
extensive, affecting numerous organizations globally, including:

- Banks and financial institutions

- Supermarkets and retail chains

- Media companies and broadcasters

- Educational institutions

- Airlines and airports

**Q. Which Systems Have Been Affected with BSOD Error?**

The BSOD error has impacted Windows 10 and Windows 11 systems running
various CrowdStrike Falcon sensor versions. While CrowdStrike has not
released a comprehensive list of all affected versions, it has
acknowledged that the problem occurs “across various sensor versions.” A
few versions of the BSOD error affected CrowdStrike Falcon sensor
include:

- Version 6.58

- Version 7.15.18513.0, as reported by users on the forums

- The “n-1” version (one version behind the latest release)

**Conclusion**

In this guide, you learnt how to fix the BSOD error due to the
CrowdStrike Falcon sensor. We will keep updating other ways to fix the
error.

**How to avoid this situation of CrowdStrike Blue screen of death?**

Avoiding a situation like the recent CrowdStrike Blue Screen of Death
(BSOD) incident requires a two-pronged approach: on CrowdStrike's side
and on the user's (IT administrator) side.

**From CrowdStrike's perspective:**

- **Thorough Testing:** More rigorous testing procedures before
  deploying updates can help identify and fix potential bugs that could
  cause BSOD issues.

**From the User's perspective (IT Admin):**

- **Update Strategy:** Consider implementing a more cautious update
  strategy, especially for critical systems. Here are some options:

  - **Delayed Updates:** You can leverage CrowdStrike's Sensor Update
    Policies and choose an option like "Auto/N" which automatically
    updates but with a delay of N versions behind the latest. This
    allows time for any major issues to be identified before deployment
    on your systems.

  - **Testing Updates:** If feasible, set up a test environment to
    evaluate new CrowdStrike sensor updates before deploying them to
    production machines. This can help catch potential problems before
    they impact critical systems.

  - **Manual Updates:** In rare cases, for highly critical systems, you
    might choose to forgo automatic updates altogether and manually
    approve updates after careful review.

**Additional Tips:**

- **Stay Informed:** Keep yourself updated on any known issues or
  upcoming updates from CrowdStrike. They typically provide information
  through their support channels.

- **Monitor Systems:** Closely monitor your systems for any signs of
  instability after applying CrowdStrike updates.

By following these practices, IT administrators can minimize the risk of
encountering a similar BSOD situation with CrowdStrike updates.
Remember, there is always a balance to be struck between receiving the
latest security updates and ensuring system stability.

**How to respond in these situations if you have 50 thousand machines
impacted?**

Reacting effectively to a large-scale Blue Screen of Death (BSOD) event
caused by a CrowdStrike update on 50,000 machines requires a swift and
coordinated response. Here is a potential action plan:

**Immediate Actions:**

1.  **Contain the Damage:**

    - **Stop Automatic Updates:** Immediately disable automatic updates
      on CrowdStrike Falcon Sensors to prevent further machines from
      being affected.

    - **Identify Affected Machines:** Utilize remote management tools or
      scripts to identify and create a list of all currently impacted
      machines (showing BSOD symptoms).

2.  **Assessment and Planning:**

    - **Severity Check:** Evaluate the severity of the situation. How
      critical are the affected systems? Is there a data breach risk, or
      is it primarily business disruption?

    - **Resource Allocation:** Assemble a team with expertise in
      CrowdStrike, Windows troubleshooting, and potentially disaster
      recovery.

    - **Communication Plan:** Develop a communication plan to keep
      stakeholders informed about the situation and the recovery
      timeline.

**Recovery Steps:**

1.  **Patch Rollback (if applicable):**

    - **CrowdStrike Update Rollback:** If CrowdStrike releases a hotfix
      or identifies a specific update causing the BSOD, you can
      potentially plan a controlled rollback of the update on identified
      machines. This might require coordination with CrowdStrike
      support.

2.  **Manual Recovery (if rollback not possible):**

    - **Safe Mode Access:** For machines that won't boot normally,
      attempt to boot them into Safe Mode with Networking. This allows
      limited functionality for troubleshooting.

    - **Driver Uninstallation:** In Safe Mode, instruct your IT team to
      uninstall the faulty CrowdStrike driver that's causing the BSOD.
      This might involve using command-line tools or specific
      CrowdStrike removal procedures.

    - **Reboot and Monitor:** After driver removal, reboot the machines
      and monitor their stability.

**Additional Considerations:**

- **Prioritization:** Prioritize recovery for the most critical business
  systems first. This might involve deploying additional resources or
  temporary workarounds.

- **Documentation:** Throughout the process, meticulously document all
  actions taken, successful or unsuccessful. This will be crucial for
  post-mortem analysis and future prevention strategies.

- **Post-Mortem Analysis:** Once the situation is under control, conduct
  a thorough post-mortem analysis to identify the root cause and areas
  for improvement. This might involve reviewing CrowdStrike
  communication, update deployment strategy, and internal response
  procedures.

**Remember:** This is a high-level plan, and the specific steps might
vary depending on your organization's infrastructure, CrowdStrike setup,
and the nature of the BSOD issue.

**It's highly recommended to consult with CrowdStrike support
immediately** for specific guidance and potential solutions in such a
large-scale situation. Their expertise can significantly reduce recovery
time and minimize business disruption.

# CrowdStrike 

Monitored the compliance of EDR tool CrowdStrike Falcon agent and SIEM
Splunk forwarder for more than 17k servers.

| **Feature** | **CrowdStrike Falcon EDR** | **Microsoft 365 Defender** |
|----|----|----|
| Endpoint detection and response | Yes | Yes |
| Device control | Yes | No |
| Application control | Yes | No |
| Threat detection and response | Yes | Yes |
| Email security | Yes | Yes |
| Data security | Yes | Yes |
| Endpoint protection | Yes | Yes |
| Pricing | Starts at \$6.99 per endpoint per month | Starts at \$3 per user per month |

## How to monitor the compliance of CrowdStrike EDR tool for windows and linux servers?

To monitor the compliance of CrowdStrike EDR tool for Windows and Linux
servers, you can use the following steps:

1\. Ensure that all servers have the CrowdStrike Falcon sensor installed
and running. You can verify this by checking the Falcon console or by
running the following command on each server:

sc query csagent

If the sensor is running, the output of the command should show a STATE
of RUNNING.

2\. Create and assign compliance policies for Windows and Linux servers.
To do this, go to Configuration \> Policies in the Falcon console and
create a new policy for each platform. You can then configure the policy
to require certain settings, such as the sensor version, the telemetry
level, and the enabled prevention technologies.

Once you have created the policies, you can assign them to servers by
going to Devices \> Groups and selecting the servers that you want to
apply the policy to.

3\. Monitor compliance reports. You can view compliance reports in the
Falcon console by going to Reports \> Compliance. These reports show
which servers are compliant with the policies that you have created.

4\. Investigate and remediate any compliance issues. If any servers are
found to be out of compliance, you can investigate the issue and take
steps to remediate it. For example, you may need to update the sensor
version or enable a required prevention technology.

In addition to the above steps, you can also use the following tips to
monitor the compliance of CrowdStrike EDR tool:

- Use the Falcon console to create dashboards that show the compliance
  status of your servers. This will allow you to quickly identify any
  servers that are out of compliance.

- Set up alerts to notify you when servers become out of
  compliance. This will help you to respond to compliance issues quickly
  and efficiently.

- Conduct regular compliance audits to ensure that all servers are
  compliant with your policies.

**Specifically for Linux servers, you can also use the following steps
to monitor compliance:**

- Use the CrowdStrike Falcon Linux Sensor Health Check tool to identify
  any compliance issues with your Linux sensors.

- Use the CrowdStrike Falcon Linux Sensor Audit tool to generate a
  detailed report of your Linux sensor configuration. This report can be
  used to identify and remediate any compliance issues.

- Use the CrowdStrike Falcon Linux Sensor Compliance Policy Enforcement
  tool to enforce your compliance policies on your Linux servers.

By following these steps, you can effectively monitor the compliance of
CrowdStrike EDR tool for Windows and Linux servers.

<span class="mark">What are the common issues we face with EDR sensors
on Windows and Linux machines?</span>

Common issues that you may face with EDR sensors on Windows and Linux
machines include:

- Sensor installation or upgrade issues.

- Sensor connectivity issues.

- Sensor configuration issues.

- Sensor performance issues.

- Sensor compatibility issues.

Sensor installation or upgrade issues can include:

- Failed installation: The sensor may fail to install due to a variety
  of reasons, such as missing prerequisites, corrupted installation
  files, or insufficient permissions.

- Incomplete installation: The sensor may be installed
  incompletely, which may prevent it from functioning properly.

- Upgrade issues: The sensor may fail to upgrade due to version
  conflicts, missing prerequisites, or corrupted installation files.

Sensor connectivity issues can include:

- Network connectivity issues: The sensor may be unable to connect to
  the CrowdStrike Falcon console due to network connectivity issues.

- Proxy configuration issues: The sensor may be unable to connect to the
  CrowdStrike Falcon console if the proxy settings are not configured
  correctly.

- Firewall issues: The sensor may be unable to connect to the
  CrowdStrike Falcon console if the firewall is blocking traffic to the
  CrowdStrike servers.

Sensor configuration issues can include:

- Incorrect settings: The sensor may be configured incorrectly, which
  may prevent it from functioning properly.

- Missing settings: Some required settings may be missing from the
  sensor configuration.

- Conflicting settings: Two or more settings may be conflicting with
  each other, which may prevent the sensor from functioning properly.

Sensor performance issues can include:

- High CPU usage: The sensor may be using too much CPU resources, which
  can impact the performance of the system.

- High memory usage: The sensor may be using too much memory
  resources, which can impact the performance of the system.

- High disk I/O: The sensor may be generating too much disk I/O, which
  can impact the performance of the system.

Sensor compatibility issues can include:

- Compatibility issues with other software: The sensor may be
  incompatible with other software that is installed on the system.

- Compatibility issues with operating system updates: The sensor may be
  incompatible with updates to the operating system.

If you are experiencing any issues with your EDR sensors, you can
contact CrowdStrike support for assistance.

<span class="mark">What are the common configuration settings we need to
do on CrowdStrike EDR Sensors?</span>

The common configuration settings that you need to do on CrowdStrike EDR
Sensors on Windows and Linux machines include:

General settings:

- Enable telemetry collection.

- Set the telemetry level.

- Configure the sensor to report to the correct CrowdStrike Falcon
  console.

- Configure the sensor to update automatically.

Prevention settings:

- Enable the required prevention technologies, such as Device
  Control, Host Firewall, and Malware Prevention.

- Configure the prevention technologies to meet your specific needs.

Detection and response settings:

- Enable the required detection and response features, such as Threat
  Hunting, Process Hunting, and Incident Response.

- Configure the detection and response features to meet your specific
  needs.

Other settings:

- Configure the sensor to generate alerts for specific events.

- Configure the sensor to exclude certain files and processes from
  scanning.

- Configure the sensor to log specific events.

Specific settings for Linux sensors:

- Configure the sensor to use a proxy server.

- Configure the sensor to use a specific network interface.

- Configure the sensor to run as a specific user.

In addition to the above settings, you may also need to configure
additional settings depending on your specific needs. For example, you
may need to configure the sensor to integrate with other security
solutions, such as your SIEM system.

For more information on configuring CrowdStrike EDR Sensors, please
refer to the CrowdStrike documentation.

Here are some additional tips for configuring CrowdStrike EDR Sensors:

- Use the CrowdStrike Falcon console to create and manage sensor
  policies. This will allow you to easily apply the same configuration
  settings to multiple sensors.

- Use the CrowdStrike Falcon console to monitor the health and status of
  your sensors. This will help you to identify and resolve any issues
  quickly and efficiently.

- Regularly review your sensor configuration to ensure that it is still
  meeting your needs.

- Contact CrowdStrike support for assistance with configuring your
  sensors.

<span class="mark">could you please share real life practical example of
EDR sensor configuration?</span>

ere is a real-life practical example of EDR sensor configuration:

Company: A large financial services company

Environment: A hybrid environment with Windows and Linux servers

Goal: To implement a comprehensive EDR solution that can detect and
respond to threats across the entire environment.

EDR sensor configuration:

- General settings:

  - Telemetry collection enabled

  - Telemetry level set to "High"

  - Sensor configured to report to the central CrowdStrike Falcon
    console

  - Sensor configured to update automatically

- Prevention settings:

  - Device Control enabled

  - Host Firewall enabled

  - Malware Prevention enabled

  - Device Control configured to block unauthorized devices from
    accessing the network

  - Host Firewall configured to block unauthorized traffic from entering
    or leaving the network

  - Malware Prevention configured to block known malware from executing
    on the system

- Detection and response settings:

  - Threat Hunting enabled

  - Process Hunting enabled

  - Incident Response enabled

  - Threat Hunting configured to scan for suspicious activity, such as
    anomalous network connections and file changes

  - Process Hunting configured to monitor for suspicious processes, such
    as known malware executables and processes that are trying to access
    sensitive data

  - Incident Response configured to automate the process of responding
    to security incidents, such as isolating infected systems and
    collecting evidence

- Other settings:

  - Sensor configured to generate alerts for all suspicious activity

  - Sensor configured to exclude certain files and processes from
    scanning, such as operating system files and known benign
    applications

  - Sensor configured to log all suspicious activity

This configuration is designed to provide a comprehensive layer of
protection for the company's hybrid environment. The Device Control,
Host Firewall, and Malware Prevention prevention technologies help to
block unauthorized devices, traffic, and malware from accessing the
network and systems. The Threat Hunting, Process Hunting, and Incident
Response detection and response features help to identify and respond to
suspicious activity quickly and efficiently.

This is just one example of how EDR sensors can be configured in a
real-world environment. The specific configuration that is best for your
organization will depend on your specific needs and requirements.

<span class="mark">How to troubleshoot CrowdStrike EDR Sensor Issues on
Windows?</span>

To troubleshoot CrowdStrike EDR sensor issues on Windows, you can follow
these steps:

1.  Verify that the sensor is installed and running. You can do this by
    checking the Windows Task Manager or by running the following
    command:

sc query csagent

If the sensor is running, the output of the command should show a STATE
of RUNNING.

2.  Verify that the sensor can connect to the CrowdStrike Falcon
    console. You can do this by running the following command:

falconctl ping

If the sensor is able to connect to the console, the output of the
command should show a Status of OK.

3.  Check the sensor logs for any errors or warnings. The sensor logs
    are located in the following directory:

C:\ProgramData\CrowdStrike\Falcon Sensor\logs

You can view the logs using a text editor, such as Notepad.

4.  Restart the sensor service. You can do this by running the following
    command:

sc restart csagent

5.  Update the sensor to the latest version. You can do this by running
    the following command:

falconctl update

6.  Contact CrowdStrike support for assistance. If you are still unable
    to resolve the issue, you can contact CrowdStrike support for
    assistance.

Here are some additional tips for troubleshooting CrowdStrike EDR sensor
issues on Windows:

- Make sure that the sensor is running as an administrator.

- Make sure that the sensor is not blocked by the firewall.

- Make sure that the sensor can access the required CrowdStrike servers.

- Disable any third-party security software that may be interfering with
  the sensor.

- Uninstall and reinstall the sensor.

If you are still unable to resolve the issue, please contact CrowdStrike
support for assistance.

<span class="mark">How to troubleshoot if CrowdStrike Sensor is
consuming lot of CPU and RAM?</span>

To troubleshoot if CrowdStrike Sensor is consuming a lot of CPU and RAM,
you can follow these steps:

1.  Check the sensor logs for any errors or warnings. The sensor logs
    are located in the following directory:

C:\ProgramData\CrowdStrike\Falcon Sensor\logs

You can view the logs using a text editor, such as Notepad.

2.  Check the sensor resource usage. You can do this by running the
    following command:

falconctl stats

This command will show you the sensor's current CPU and memory usage.

3.  Check the system resource usage. You can do this by opening the
    Windows Task Manager.

4.  Compare the sensor resource usage to the system resource usage. If
    the sensor is using a significant portion of the system's resources,
    then it is likely that the sensor is causing the performance issue.

5.  Identify the processes that are consuming the most CPU and memory.
    You can do this by opening the Windows Task Manager and sorting the
    processes by CPU or memory usage.

6.  Disable any unnecessary processes. If you see any processes that are
    not essential to the operation of the system, you can try disabling
    them to see if this resolves the issue.

7.  Update the sensor to the latest version. You can do this by running
    the following command:

falconctl update

8.  Contact CrowdStrike support for assistance. If you are still unable
    to resolve the issue, you can contact CrowdStrike support for
    assistance.

Here are some additional tips for troubleshooting CrowdStrike Sensor CPU
and RAM usage issues:

- Make sure that the sensor is installed on a system that meets the
  minimum hardware requirements.

- Make sure that the sensor is not running on a system that is already
  under heavy load.

- Try disabling some of the sensor's features, such as Device Control or
  Host Firewall.

- Try excluding certain files and processes from scanning.

- Try running the sensor in a sandboxed environment, such as a virtual
  machine.

If you are still unable to resolve the issue, please contact CrowdStrike
support for assistance.

<span class="mark">How much RAM and CPU should be consumed by EDR
Sensors?</span>

The amount of RAM and CPU that EDR sensors consume depends on a number
of factors, including the specific sensor, the system on which it is
installed, and the features that are enabled. In general, EDR sensors
should consume a relatively small amount of resources, typically less
than 1% of CPU and 1GB of RAM.

However, there are some cases where EDR sensors may consume more
resources, such as during a scan or when multiple features are enabled.
Additionally, EDR sensors installed on older or less powerful systems
may consume more resources.

Here are some tips to reduce the RAM and CPU usage of EDR sensors:

- Disable unnecessary features.

- Exclude certain files and processes from scanning.

- Install the sensor on a system that meets the minimum hardware
  requirements.

- Upgrade the system's hardware, if necessary.

- Run the sensor in a sandboxed environment, such as a virtual machine.

If you are concerned about the RAM and CPU usage of your EDR sensors,
you can monitor their resource usage using the system's task manager or
a third-party tool. You can also contact the vendor of your EDR solution
for assistance.

Here are some specific examples of RAM and CPU usage for popular EDR
sensors:

- CrowdStrike EDR Sensor: 0.5% CPU and 500MB RAM

- SentinelOne Agent: 0.3% CPU and 250MB RAM

- Carbon Black Falcon Sensor: 0.4% CPU and 300MB RAM

It is important to note that these are just averages and actual resource
usage may vary.

<span class="mark">How much RAM and CPU should be consumed by
Crowdstrike Falcon Sensors?</span>

How to troubleshoot if CrowdStrike Sensor is causing performance issue
with Windows machines?

Monitored the compliance of EDR tool CrowdStrike Falcon agent and SIEM
Splunk forwarder for more than 17k servers.

| **Feature** | **CrowdStrike Falcon EDR** | **Microsoft 365 Defender** |
|----|----|----|
| Endpoint detection and response | Yes | Yes |
| Device control | Yes | No |
| Application control | Yes | No |
| Threat detection and response | Yes | Yes |
| Email security | Yes | Yes |
| Data security | Yes | Yes |
| Endpoint protection | Yes | Yes |
| Pricing | Starts at \$6.99 per endpoint per month | Starts at \$3 per user per month |

**<span class="mark">How to monitor the compliance of CrowdStrike EDR
tool for windows and linux servers?</span>**

To monitor the compliance of CrowdStrike EDR tool for Windows and Linux
servers, you can use the following steps:

1\. Ensure that all servers have the CrowdStrike Falcon sensor installed
and running. You can verify this by checking the Falcon console or by
running the following command on each server:

sc query csagent

If the sensor is running, the output of the command should show a STATE
of RUNNING.

2\. Create and assign compliance policies for Windows and Linux servers.
To do this, go to Configuration \> Policies in the Falcon console and
create a new policy for each platform. You can then configure the policy
to require certain settings, such as the sensor version, the telemetry
level, and the enabled prevention technologies.

Once you have created the policies, you can assign them to servers by
going to Devices \> Groups and selecting the servers that you want to
apply the policy to.

3\. Monitor compliance reports. You can view compliance reports in the
Falcon console by going to Reports \> Compliance. These reports show
which servers are compliant with the policies that you have created.

4\. Investigate and remediate any compliance issues. If any servers are
found to be out of compliance, you can investigate the issue and take
steps to remediate it. For example, you may need to update the sensor
version or enable a required prevention technology.

In addition to the above steps, you can also use the following tips to
monitor the compliance of CrowdStrike EDR tool:

- Use the Falcon console to create dashboards that show the compliance
  status of your servers. This will allow you to quickly identify any
  servers that are out of compliance.

- Set up alerts to notify you when servers become out of
  compliance. This will help you to respond to compliance issues quickly
  and efficiently.

- Conduct regular compliance audits to ensure that all servers are
  compliant with your policies.

**Specifically for Linux servers, you can also use the following steps
to monitor compliance:**

- Use the CrowdStrike Falcon Linux Sensor Health Check tool to identify
  any compliance issues with your Linux sensors.

- Use the CrowdStrike Falcon Linux Sensor Audit tool to generate a
  detailed report of your Linux sensor configuration. This report can be
  used to identify and remediate any compliance issues.

- Use the CrowdStrike Falcon Linux Sensor Compliance Policy Enforcement
  tool to enforce your compliance policies on your Linux servers.

By following these steps, you can effectively monitor the compliance of
CrowdStrike EDR tool for Windows and Linux servers.

<span class="mark">What are the common issues we face with EDR sensors
on Windows and Linux machines?</span>

Common issues that you may face with EDR sensors on Windows and Linux
machines include:

- Sensor installation or upgrade issues.

- Sensor connectivity issues.

- Sensor configuration issues.

- Sensor performance issues.

- Sensor compatibility issues.

Sensor installation or upgrade issues can include:

- Failed installation: The sensor may fail to install due to a variety
  of reasons, such as missing prerequisites, corrupted installation
  files, or insufficient permissions.

- Incomplete installation: The sensor may be installed
  incompletely, which may prevent it from functioning properly.

- Upgrade issues: The sensor may fail to upgrade due to version
  conflicts, missing prerequisites, or corrupted installation files.

Sensor connectivity issues can include:

- Network connectivity issues: The sensor may be unable to connect to
  the CrowdStrike Falcon console due to network connectivity issues.

- Proxy configuration issues: The sensor may be unable to connect to the
  CrowdStrike Falcon console if the proxy settings are not configured
  correctly.

- Firewall issues: The sensor may be unable to connect to the
  CrowdStrike Falcon console if the firewall is blocking traffic to the
  CrowdStrike servers.

Sensor configuration issues can include:

- Incorrect settings: The sensor may be configured incorrectly, which
  may prevent it from functioning properly.

- Missing settings: Some required settings may be missing from the
  sensor configuration.

- Conflicting settings: Two or more settings may be conflicting with
  each other, which may prevent the sensor from functioning properly.

Sensor performance issues can include:

- High CPU usage: The sensor may be using too much CPU resources, which
  can impact the performance of the system.

- High memory usage: The sensor may be using too much memory
  resources, which can impact the performance of the system.

- High disk I/O: The sensor may be generating too much disk I/O, which
  can impact the performance of the system.

Sensor compatibility issues can include:

- Compatibility issues with other software: The sensor may be
  incompatible with other software that is installed on the system.

- Compatibility issues with operating system updates: The sensor may be
  incompatible with updates to the operating system.

If you are experiencing any issues with your EDR sensors, you can
contact CrowdStrike support for assistance.

<span class="mark">What are the common configuration settings we need to
do on CrowdStrike EDR Sensors?</span>

The common configuration settings that you need to do on CrowdStrike EDR
Sensors on Windows and Linux machines include:

General settings:

- Enable telemetry collection.

- Set the telemetry level.

- Configure the sensor to report to the correct CrowdStrike Falcon
  console.

- Configure the sensor to update automatically.

Prevention settings:

- Enable the required prevention technologies, such as Device
  Control, Host Firewall, and Malware Prevention.

- Configure the prevention technologies to meet your specific needs.

Detection and response settings:

- Enable the required detection and response features, such as Threat
  Hunting, Process Hunting, and Incident Response.

- Configure the detection and response features to meet your specific
  needs.

Other settings:

- Configure the sensor to generate alerts for specific events.

- Configure the sensor to exclude certain files and processes from
  scanning.

- Configure the sensor to log specific events.

Specific settings for Linux sensors:

- Configure the sensor to use a proxy server.

- Configure the sensor to use a specific network interface.

- Configure the sensor to run as a specific user.

In addition to the above settings, you may also need to configure
additional settings depending on your specific needs. For example, you
may need to configure the sensor to integrate with other security
solutions, such as your SIEM system.

For more information on configuring CrowdStrike EDR Sensors, please
refer to the CrowdStrike documentation.

Here are some additional tips for configuring CrowdStrike EDR Sensors:

- Use the CrowdStrike Falcon console to create and manage sensor
  policies. This will allow you to easily apply the same configuration
  settings to multiple sensors.

- Use the CrowdStrike Falcon console to monitor the health and status of
  your sensors. This will help you to identify and resolve any issues
  quickly and efficiently.

- Regularly review your sensor configuration to ensure that it is still
  meeting your needs.

- Contact CrowdStrike support for assistance with configuring your
  sensors.

<span class="mark">could you please share real life practical example of
EDR sensor configuration?</span>

ere is a real-life practical example of EDR sensor configuration:

Company: A large financial services company

Environment: A hybrid environment with Windows and Linux servers

Goal: To implement a comprehensive EDR solution that can detect and
respond to threats across the entire environment.

EDR sensor configuration:

- General settings:

  - Telemetry collection enabled

  - Telemetry level set to "High"

  - Sensor configured to report to the central CrowdStrike Falcon
    console

  - Sensor configured to update automatically

- Prevention settings:

  - Device Control enabled

  - Host Firewall enabled

  - Malware Prevention enabled

  - Device Control configured to block unauthorized devices from
    accessing the network

  - Host Firewall configured to block unauthorized traffic from entering
    or leaving the network

  - Malware Prevention configured to block known malware from executing
    on the system

- Detection and response settings:

  - Threat Hunting enabled

  - Process Hunting enabled

  - Incident Response enabled

  - Threat Hunting configured to scan for suspicious activity, such as
    anomalous network connections and file changes

  - Process Hunting configured to monitor for suspicious processes, such
    as known malware executables and processes that are trying to access
    sensitive data

  - Incident Response configured to automate the process of responding
    to security incidents, such as isolating infected systems and
    collecting evidence

- Other settings:

  - Sensor configured to generate alerts for all suspicious activity

  - Sensor configured to exclude certain files and processes from
    scanning, such as operating system files and known benign
    applications

  - Sensor configured to log all suspicious activity

This configuration is designed to provide a comprehensive layer of
protection for the company's hybrid environment. The Device Control,
Host Firewall, and Malware Prevention prevention technologies help to
block unauthorized devices, traffic, and malware from accessing the
network and systems. The Threat Hunting, Process Hunting, and Incident
Response detection and response features help to identify and respond to
suspicious activity quickly and efficiently.

This is just one example of how EDR sensors can be configured in a
real-world environment. The specific configuration that is best for your
organization will depend on your specific needs and requirements.

## RAM-CPU

<span class="mark">How much RAM and CPU should be consumed by
Crowdstrike Falcon Sensors?</span>

How to troubleshoot if CrowdStrike Sensor is causing performance issue
with Windows machines?

<span class="mark">How much RAM and CPU should be consumed by EDR
Sensors?</span>

The amount of RAM and CPU that EDR sensors consume depends on a number
of factors, including the specific sensor, the system on which it is
installed, and the features that are enabled. In general, EDR sensors
should consume a relatively small amount of resources, typically less
than 1% of CPU and 1GB of RAM.

However, there are some cases where EDR sensors may consume more
resources, such as during a scan or when multiple features are enabled.
Additionally, EDR sensors installed on older or less powerful systems
may consume more resources.

Here are some tips to reduce the RAM and CPU usage of EDR sensors:

- Disable unnecessary features.

- Exclude certain files and processes from scanning.

- Install the sensor on a system that meets the minimum hardware
  requirements.

- Upgrade the system's hardware, if necessary.

- Run the sensor in a sandboxed environment, such as a virtual machine.

If you are concerned about the RAM and CPU usage of your EDR sensors,
you can monitor their resource usage using the system's task manager or
a third-party tool. You can also contact the vendor of your EDR solution
for assistance.

Here are some specific examples of RAM and CPU usage for popular EDR
sensors:

- CrowdStrike EDR Sensor: 0.5% CPU and 500MB RAM

- SentinelOne Agent: 0.3% CPU and 250MB RAM

- Carbon Black Falcon Sensor: 0.4% CPU and 300MB RAM

It is important to note that these are just averages and actual resource
usage may vary.

<span class="mark">How to troubleshoot if CrowdStrike Sensor is
consuming lot of CPU and RAM?</span>

To troubleshoot if CrowdStrike Sensor is consuming a lot of CPU and RAM,
you can follow these steps:

2.  Check the sensor logs for any errors or warnings. The sensor logs
    are located in the following directory:

C:\ProgramData\CrowdStrike\Falcon Sensor\logs

You can view the logs using a text editor, such as Notepad.

3.  Check the sensor resource usage. You can do this by running the
    following command:

falconctl stats

This command will show you the sensor's current CPU and memory usage.

8.  Check the system resource usage. You can do this by opening the
    Windows Task Manager.

9.  Compare the sensor resource usage to the system resource usage. If
    the sensor is using a significant portion of the system's resources,
    then it is likely that the sensor is causing the performance issue.

10. Identify the processes that are consuming the most CPU and memory.
    You can do this by opening the Windows Task Manager and sorting the
    processes by CPU or memory usage.

11. Disable any unnecessary processes. If you see any processes that are
    not essential to the operation of the system, you can try disabling
    them to see if this resolves the issue.

12. Update the sensor to the latest version. You can do this by running
    the following command:

falconctl update

9.  Contact CrowdStrike support for assistance. If you are still unable
    to resolve the issue, you can contact CrowdStrike support for
    assistance.

Here are some additional tips for troubleshooting CrowdStrike Sensor CPU
and RAM usage issues:

- Make sure that the sensor is installed on a system that meets the
  minimum hardware requirements.

- Make sure that the sensor is not running on a system that is already
  under heavy load.

- Try disabling some of the sensor's features, such as Device Control or
  Host Firewall.

- Try excluding certain files and processes from scanning.

- Try running the sensor in a sandboxed environment, such as a virtual
  machine.

If you are still unable to resolve the issue, please contact CrowdStrike
support for assistance.

# CS Agent issues

<span class="mark">How to troubleshoot CrowdStrike EDR Sensor Issues on
Windows?</span>

To troubleshoot CrowdStrike EDR sensor issues on Windows, you can follow
these steps:

2.  Verify that the sensor is installed and running. You can do this by
    checking the Windows Task Manager or by running the following
    command:

sc query csagent

If the sensor is running, the output of the command should show a STATE
of RUNNING.

3.  Verify that the sensor can connect to the CrowdStrike Falcon
    console. You can do this by running the following command:

falconctl ping

If the sensor is able to connect to the console, the output of the
command should show a Status of OK.

4.  Check the sensor logs for any errors or warnings. The sensor logs
    are located in the following directory:

C:\ProgramData\CrowdStrike\Falcon Sensor\logs

You can view the logs using a text editor, such as Notepad.

5.  Restart the sensor service. You can do this by running the following
    command:

sc restart csagent

6.  Update the sensor to the latest version. You can do this by running
    the following command:

falconctl update

7.  Contact CrowdStrike support for assistance. If you are still unable
    to resolve the issue, you can contact CrowdStrike support for
    assistance.

Here are some additional tips for troubleshooting CrowdStrike EDR sensor
issues on Windows:

- Make sure that the sensor is running as an administrator.

- Make sure that the sensor is not blocked by the firewall.

- Make sure that the sensor can access the required CrowdStrike servers.

- Disable any third-party security software that may be interfering with
  the sensor.

- Uninstall and reinstall the sensor.

If you are still unable to resolve the issue, please contact CrowdStrike
support for assistance.
