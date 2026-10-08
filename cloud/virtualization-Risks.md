1️⃣1️⃣ What is Virtualization? What are the security risks?
Q1: What is Virtualization?
Virtualization is the abstraction of physical hardware to create multiple virtual machines (VMs) running on a single physical host using a hypervisor.
Q2: Security Risks in Virtualization
Hypervisor Attack
If compromised, all VMs compromised
VM Escape
Attacker escapes from VM to host
VM Sprawl
Unmanaged VMs increase attack surface
Snapshot Leakage
Sensitive data stored in snapshots
Insecure Inter-VM Communication
East-west traffic not monitored
Resource Contention
DoS via resource exhaustion
Side-channel Attacks
Spectre/Meltdown type attacks



1️⃣ What is a Virtualized Environment?
Q1: What is a virtualized environment?
A virtualized environment is an IT infrastructure where physical computing resources (CPU, memory, storage, network) are abstracted and divided into multiple isolated virtual instances using a hypervisor.

It allows multiple Virtual Machines (VMs) to run on a single physical server.

Q2: What are the main components of a virtualized environment?
Image

Image

Image

Image

1. Hypervisor
Software layer that manages VMs.

Type 1 (Bare-metal) – e.g., VMware ESXi

Type 2 (Hosted) – e.g., Oracle VM VirtualBox

2. Virtual Machines (VMs)
Each VM contains:

Guest OS

Applications

Virtual network interfaces

Virtual disks

3. Virtual Networking
vSwitch

Virtual NICs

Network segmentation

4. Storage Virtualization
Virtual disks (VHD/VMDK)

Shared storage pools

Q3: What are security risks in virtualized environments?
Hypervisor compromise

VM escape attacks

VM sprawl

Snapshot leakage

East-west traffic invisibility

Resource exhaustion DoS

Side-channel attacks (Spectre/Meltdown)



