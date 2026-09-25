Your security posture is the overall security status of all your
software and hardware assets, networks, services, and information. It
also includes the controls and measures you have in place to protect
your enterprise from cyber-attacks, your ability to manage

your defenses and your readiness and ability to react to and recover
from security events.

A conceptual diagram representing your security posture would look
something like this:

<img src="media/image1.png" style="width:6.00885in;height:5.16711in" />

At the very core of understanding your security posture is an accurate
inventory of all your assets, including both core and perimeter assets.
This includes on-premises, cloud, mobile, and 3rd party assets; managed
and unmanaged assets; applications

and infrastructure, catalogued based on geographic location. It is
important to understand the business criticality of each asset as well,
as this is an important component of calculating breach risk.

Surrounding this core is an enumeration of your existing security
controls, deployed to manage your defenses. Inherent in this

enumeration is also an understanding of how effective these controls are
in reducing your cyber risk. Outside of that circle are the various risk
items and attack vectors.

Attack vectors are the methods that adversaries use to breach or
infiltrate your network. Attack vectors take many different

forms, ranging from malware and ransomware, to man-in-the middle
attacks, compromised credentials, and phishing. Some

attack vectors target weaknesses in your security and overall
infrastructure, others target weaknesses in the humans that have

access to your network.

This combination of your inventory, security controls, and defenses
against numerous attack vectors makes up your attack surface.

Your attack surface is represented by all the points on your network
where an adversary can attempt to gain entry to your

information systems. Basically, any technique that a human can use to
gain unauthorized access to your company’s data via any asset.

And keep in mind that risk extends beyond unpatched software
vulnerabilities (CVEs). Your ability to monitor your assets in risk
areas such as unpatched software, password issues, misconfigurations,
encryption issues, phishing, web and ransomware, denial of service
attacks and many others is the mainstay of your security posture.

The stronger and more resilient your security posture, the lower your
cyber risk and greater your cyber-resilience. Therefore,

understanding the full scope of your security posture and correctly
prioritizing areas of relevant risk is essential to protecting your

organization against breaches.

**Cybersecurity is a complex problem to solve**

Understanding and defining the full scope of your cybersecurity posture
is essential to protecting your business against breaches.

To understand, optimize and strengthen your security posture, you need
to:

- Analyze your current security posture

- Identify protection gaps that are increasing risk

- Then take action to eliminate those gaps

This guide explains in detail what an organization’s security posture
is, how you can define and measure it and the steps you

need to take to improve it.

## Asset Inventory

Inventory is the core of your security posture

Asset inventory is an accurate and up to date count of all hardware,
software, and network assets in your enterprise. However, being aware of
an asset is not sufficient. You also need to know detailed information
about each asset and whether that asset is a risk. This involves:

- Categorizing assets by type of asset, role, and geo location including
  in-depth information like software and hardware details, status of
  ports, user accounts, roles, and services linked to that asset

- Determining business criticality of each asset

- Ensuring that all assets are running properly licensed and updated
  software while adhering to overall security policy

- Continuously monitoring them to get a real time picture of their risk
  profile and their lifecycle management

- Creating triggered actions whenever an asset deviates from enterprise
  security policy

- Deciding which assets should be decommissioned if no longer updated or
  being used

**What is an IT asset?**

It is essentially any device, application, service, or cloud instance
that has access to your enterprise network or data.

**The importance of inventory**

Getting an accurate IT asset inventory is foundational to your security
posture. The ability to track and audit your inventory is

a baseline requirement for most security standards, including the CIS
Top 20, HIPAA, and PCI. Having an accurate, up-to-date

asset inventory also ensures your company can keep track of the type and
age of hardware in use. By keeping track of this

information, you are more easily able to identify technology gaps and
refresh cycles. As systems begin to age, and are no longer

supported by the manufacturer, they present a security risk to your
organization. Unsupported software that no longer receives updates from
the manufacturer brings the risk of not being monitored for new
vulnerabilities and implementation of patches.

Inventory challenges

Unfortunately, it is challenging to keep track of the various devices,
applications, and services used by enterprise users. As a result, it is
difficult to correctly target vulnerability scans and risk assessments.
It is particularly problematic to cover non-traditional assets such as
bring-your-own devices, IoT, mobile assets, and cloud services.

- The set of assets in the enterprise changes constantly with devices
  being added and retired, physical machines migrating to virtual and
  various stakeholders constantly installing and updating software (with
  or without approval).

- Inaccurate inventory makes managing compliance and cyber-risk very
  difficult.

- An outdated inventory impedes the velocity of business.

- Applying manual effort to keep inventory updated is very time and
  resource intensive and does not work at scale.

- Enterprise security teams do not often control all assets, which makes
  the task of understanding Your assets and gathering insights about
  them even more difficult.

Traditional inventory tools typically only track managed assets.
Non-traditional assets like IoT are either left undiscovered or
partially tracked by a motley collection of specialized tools, one for
each asset category.

**Do you know?**

- What type of devices are on your network?

- Where does the sensitive data reside?

- Who has access to the sensitive data?

- How many devices are utilizing a particular current security control?

- What is the OS and distribution of devices on the network?

- What is the number and type of approved applications on workstations?

- How many and what types of assets are up to date on OS patches?

- Which assets are up to date on application patches?

## Enterprise Attack Surface

The second most important aspect of your security posture is measurement
and mapping of your attack surface. So, what is your enterprise attack
surface and how can you measure it?

Your attack surface is represented by all the points on your network
where an adversary can attempt to gain entry to your information
systems. For a medium to large sized enterprise, the attack surface can
be gigantic. Hundreds of thousands of assets potentially targeted by
hundreds of attack vectors can mean that your attack surface is made up
of tens of millions to hundreds of billions of signals that must be
always monitored.

The graph below represents your attack surface. The x-axis represents
all your assets—everything from traditional infrastructure, servers,
databases, switches, and routers, etc., and your apps,
endpoints—managed, unmanaged, BYOD, mobile phones, and tablets, IoTs.
This also includes cloud apps—personal applications of employees—
Google, Gmail, LinkedIn, etc., official SaaS applications, public facing
web sites. At the right end of the x-axis are 3rd party vendors who
bring risk into your network because of

certain trust relationships.

What is an Attack Vector?

Attack vectors are the methods that adversaries use to breach or
infiltrate your network. Attack vectors take many different forms,
ranging from malware and ransomware, to main-the-middle attacks,
compromised credentials, and phishing. Some attack vectors target
weaknesses in your security and overall infrastructure, others target
weaknesses in the humans that have access to your

network. Some of the common attack vectors are:

- Compromised Credentials

- Misconfiguration

- Malicious Insider

- Phishing

- Weak & Stolen Credentials

- Ransomware

- Missing or Poor Encryption

- Trust Relationships

The y-axis represents the hundreds of attack vectors available to your
adversaries, ranging from simple things like weak passwords, to more
complex things like phishing, unpatched software, encryption issues,
misconfiguration, etc. The y-axis also has zero-day

vulnerabilities, security bugs that are “unknown” until they are first
used by the adversary.

This gigantic x-y plot is your attack surface. In a typical breach, the
adversary uses some point on this attack surface to compromise an
(Internet facing) asset. Other points are then used to move laterally
across the enterprise, compromise some asset, and

then to exfiltrate data or do some damage.

The entry point for cyber attackers can be as trivial as a Wi-Fi-enabled
camera used to take pictures at the company’s summer picnic.

<img src="media/image2.png" style="width:5.70198in;height:2.87764in" />

3 truths about your security posture status quo

**1. Project oriented approach**

Most organizations’ current security posture consists of tools that have
been deployed because of addressing security projects. This
project-oriented approach to security is one where teams are focused on
completing security projects off to-do lists without having any real
insight into whether these projects have a meaningful impact on your
organization’s security posture. This results in narrowly focused
security practices.

**2. Reactive tactics**

Nearly all new security spending and effort is directed toward detecting
an attack in progress or responding to one that has already occurred.
While putting out security “fires” is an essential practice; the bulk of
your security investments should not be reactive.

**3. Misalignment with attack vectors**

Are you spending most of your security efforts on fixing indicators of
compromise (IoC) alerts, patching, and chasing commitment biases,
without really knowing the answers to questions like which of my assets
are most critical, what threats are active right now, or which of my
assets are most vulnerable?

Continuing to dedicate time, resources, and budget toward fixing
problems without having a clear understanding of how those actions
reduce the company’s overall cyber-risk is not fruitful. Your existing
security practices need to be evaluated with a fresh lens to understand
your current security posture, find gaps, and then take action to fill
those gaps and improve your security posture.

**Challenges in accurately understanding your security posture stem from
4 factors:**

1.  Lack of visibility

2.  Lack of structure

3.  Lack of clarity

4.  Lack of up-to-date data

4 reasons why your visibility into security posture is inadequate

**1. Technology Sprawl**

Blind spots appear progressively over time as an organization grows,
matures, and adopts new technologies, adds new people, makes
acquisitions, and embraces new processes. Cloud computing, mobility, IoT
and other aspects of digital transformation have been a major
contributing factor in recent years.

**2. Whose job is it, anyway?**

Enterprise security teams obviously do not control all aspects of the
business and rely heavily on cooperation from other departments and
business units to loop security in at the right time before launching
new products and buying new software and assets etc.

**3. Legacy point products**

Large enterprises have a plethora of traditional and legacy tools that
do not work together synergistically, leading to a motley collection of
specialized tools to do various jobs. It is challenging to get the
findings and results of all the tools under one single dashboard thus
key data and observations are routinely missed.

**4. Not a human-scale problem**

Analysing and understanding the enterprise security posture is no longer
a human scale problem because to get an accurate idea of breach risk,
security teams need to analyse a lot of data—up to several hundred
billion time-varying signals from the extended

network of devices, apps, and users. This requires the use of AI to
automatically identify, monitor, analyse, and prioritize action items
based on risk and business criticality.

Growing complexity makes your enterprise more vulnerable
