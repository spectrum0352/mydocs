Virtualization
Virtual version of host hardware
Separate OS, independent CPU, memory, network, etc
68 of 178
Multiple virtual servers on one box/physical device
Hardware consolidation and reduced energy consumption
System Recovery
Hypervisor
Virtual Machine Manager
Manages the virtual platform and guest OS
Hardware management (CPU, Networking, Security etc)
Types of Hypervisors
Type II
Runs on top of host OS (Windows, Linux, Mac, etc)
Type I
Runs directly on top of hardware, independent of host OS. (e.g bootable Linux thumbdrive)
Bare metal, embedded, native
Application containerization
Run an application without launching an entire VM
Uses just the right resources for the application
Everything you need to run the app is in the image (container/cell)
Cloud-based Virtualization
IaaS (e.g. AWS, MS Azure)
Virtualization Benefits
Security Feature
Patch management
Centralized hardware maintenance
Resilient and high availability
Great for testing everything and sandboxing environment
Snapshots and backups
Network Separation
Virtual Threats
VM sprawl - the out-of-control creation of VMs outside of security controls.
It becomes almost too easy to build instances
The virtual machines are sprawled everywhere in which become extremely difficult to deprovision
The correct way to deploy many instances is through a formal process and detailed documentation
You should have information on every virtual object
VM escape - when a user inside a VM finds a way to break out the VM and get into the underlying hypervisor/host
OS.
Virtualization Hardening
Remove remnant data
Make good policies
Define user privileges
Patch everything!
CASB - Cloud Access Security Brokers: Intermediary between your infrastructure(in-house stuff) and the cloud;
Make sure policies are controlled; watches for malware;
Visibility - determine what apps are in use; are they authorized to use the apps?
Compliance - are users complying with HIPAA, PCI?
69 of 178
Threat prevention - allow access by authorized users, prevent attacks
Data security - ensure that all data transfers are encrypted; Protect the transfer of PII with DLP
Containers
Containers are self-contained applications that can communicate with network resources that have been explicity
allowed
Runs isolated instances of programs and services
Can depend on each other, and can be configured to communicate with each other on a single host
Runs a single program and all its dependencies, when the programs exists
IaaS - Infrastructure-as-a-Service
Basically virtual machines hosted by a cloud provider's infrastructure; Users simply connect to them via RDP
(remote desktop protocol) or another secure remote connection protocol and use the as they would any other
computer.
e.g: AWS, Microsoft Azure, Digital Ocean, Google Cloud.
PaaS - Platform-as-a-Service
Offers a computing platform, such as Web application server or database server with easy setup focusing on quick
deployment; Enables you to access a software development platform without the need to host it yourself.
e.g: Heroku, SalesForce.
SaaS - Software-as-a-Service
SaaS is a subscription based license; Access applications via subscription;
e.g: Microsoft Office 365, Dropbox storage, Google Docs.
IaaS | PaaS | SaaS
70 of 178
�
� On-premise: Your application are on local hardware; Your servers are in your data center in your building
