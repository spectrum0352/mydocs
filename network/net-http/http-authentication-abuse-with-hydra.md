# Exploiting HTTP Authentication with Hydra

xHydra is the graphical interface for Hydra, designed to perform fast dictionary attacks against various protocols. While often used for services like FTP or SSH, this guide focuses on exploiting HTTP-GET authentication.

Step 1: Target Configuration

Open xHydra in Kali Linux and navigate to the Target tab:

Single Target: Enter the IP address of your target (e.g., 192.168.0.105).
Port: Set this to 80 (the standard port for HTTP).
Protocol: Select http-get from the dropdown menu.
Output Options: It is helpful to check Show Attempts so you can monitor the progress in real-time.
Step 2: Password and Username Setup

Navigate to the Passwords tab to define your credentials:

Username: If you know the specific username, select Username and type it in. Otherwise, select Username List and provide the path to your user.txt file.
Password: Select Password List and browse to the path of your wordlist (e.g., /usr/share/wordlists/rockyou.txt or your custom pass.txt).
Step 3: Executing the Attack

Once your target and lists are configured, move to the Start tab:

Click the Start button at the bottom left.
xHydra will begin testing combinations from your lists against the target.
If a match is found, it will be highlighted in the output window, showing the valid login and password.
Key Corrections Made:

Protocol Consistency: Your text mentioned "FTP," but your images and the port (80) correctly show an HTTP-GET attack. I updated the text to match the images.
Clarity: Refined the instructions for selecting file paths for username and password lists.
Real-world Context: Added a mention of standard wordlist paths like rockyou.txt for better practical application.
 

 

Command for Hydra Attacks
To translate the configuration from your images into a terminal command, you would use the following syntax. Based on your screenshots, the attack is targeting an HTTP-GET form on port 80.

The Command-Line Syntax

Bash

hydra -L /root/user.txt -P /root/pass.txt -s 80 192.168.0.105 http-get /foo/bar/protected.html

Breakdown of the Flags

Using the CLI is often preferred for speed and easier logging. Here is what each part of that command does:

-L /root/user.txt: Points to your List of usernames (the lowercase -l is used if you only have one specific name).
-P /root/pass.txt: Points to your List of passwords (the lowercase -p is used for a single password).
-s 80: Explicitly sets the Service Port to 80.
192.168.0.105: The Target IP address.
http-get: The Protocol module being used.
/foo/bar/protected.html: The specific Path or page on the server that is protected by the login prompt (as seen in the command preview at the bottom of your first image).
Useful CLI Add-ons

If you want to replicate the "Show Attempts" and "Verbose" features from your screenshots, you can add these flags:

-V: Enables Verbose mode to see every attempt as it happens.
-t 16: Sets the number of parallel tasks (threads). Increasing this can speed up the attack, though setting it too high might crash the target service.
 

 