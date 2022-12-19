# Rutgers ITI InfoSec | Scarlet Castle Cyber-Range
### Cloud and Baremetal
---
# Use the KWXK Ansible Installer Shell Script on your machine first.
https://github.com/kwxk/Rutgers_Cyber_Range/blob/main/kwxk-ansible-installer.md 
---

### [kwk-ansible-installer.sh](https://github.com/kwxk/Rutgers_Cyber_Range/blob/main/Bare%20Metal%20Setup%20-%20Rutgers%20Cyber%20Range/kwxk-ansible-installer.sh)



##### This script is a shell script that installs Ansible and Python on a user-specified operating system. The script begins by presenting the user with a list of options for the operating system: macOS, Linux, or Windows. The user is prompted to enter their choice, which is then stored in the `choice` variable.

The script uses an `if` statement to check the value of `choice` and determine which operating system was selected. If the value of `choice` is either "1" or "macOS", the script installs Ansible and Python on a macOS system using the `brew` package manager. The script first checks if `brew` is already installed by using the `command` command and the `-v` option to check if the `brew` command is available. If `brew` is not installed, the script installs it using the `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"` command.

The script then checks if Ansible is already installed, and installs it using the `brew install ansible` command if it is not. The script also prints the version of Ansible using the `ansible --version` command. Finally, the script checks if Python is already installed, and installs it using the `brew install python` command if it is not. The script also prints the version of Python using the `python -V` command.

If the value of `choice` is either "2" or "Linux", the script installs Ansible and Python on a Linux system using the `apt-get` package manager. The script first checks if Ansible is already installed, and installs it using the `apt-get` commands if it is not. The script also prints the version of Ansible using the `ansible --version` command. The script then installs Python 3 using the `apt-get install python3` command and prints the version of Python using the `python3 -V` command.

If the value of `choice` is either "3" or "Windows", the script installs Ansible and Python on a Windows system using the `choco` package manager. The script first checks if `choco` is already installed, and installs it using the `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))` command if it is not. The script then checks if ansible is already installed, and installs it using the `choco install ansible` command if it is not. The script also prints the version of ansible using the `ansible --version` command. Finally, the script checks if Python is already installed, and installs it using the `choco install python` command if it is not. The script also prints the version of Python using the `python -V` command.

If the value of `choice` does not match any of the conditions, the script prints an error message saying "Invalid choice. Please enter a valid number (1, 2, or 3)."


---
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
    

##### To set up credentials in the AWS CLI, follow these steps:

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

#### To download the AWS CLI on a Linux machine, follow these steps:

 **Open a terminal window and run the following command to install the required dependencies:**

1.  sudo apt-get  update
    
2.  sudo apt-get install python3 python3-pip

3.  Run the following command to install the AWS CLI using pip, the Python package manager:

1.  pip3 install awscli --upgrade  --user

5.  Add the ~/.local/bin directory to your PATH environment variable by running the following command:

1.  echo  'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

4.  Verify the installation by running the following command: ‘aws --version’

Use aws configure to set up credentials on your computer. This will allow you to run the Terraform without a credential file or keys being in the Terraform files itself.

## Terraform
Install Terraform here: [https://developer.hashicorp.com/Terraform/tutorials/aws-get-started/install-cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Run the Terraform from your command line. Preferably, use an IDE like Visual Studio with its built-in terminal.

Terraform will run all Terraform files within the project folder. Make sure to navigate to the project folder in which Terraform is in. Then run the **‘Terraform init’** command to create the state file that will keep track of the infrastructure

Next, run the **‘Terraform plan’** command to see the cloud resources that will be spun-up

  

Finally, run the **‘Terraform apply’** command to create the cloud resources. Navigate to AWS console to find details about how to SSH into the machine.

# Bare-metal Based Cyber Range

## Ansible

Ansible is an automation tool that enables the execution of tasks on multiple systems simultaneously. It allows users to define instructions in the form of playbooks, which can be executed on targeted systems to automate processes and reduce the workload. Ansible is a useful tool for streamlining the configuration and management of large numbers of systems, providing an efficient means of automating repetitive tasks and reducing the potential for human error.

  

## Set Up Details

To install Ansible on a Windows machine, you will need to install the Windows Subsystem for Linux (WSL) and then use the package manager for your preferred Linux distribution to install ansible.

Here are the steps to do this:

1.  Enable the Windows Subsystem for Linux (WSL) feature by following these instructions: [https://docs.microsoft.com/en-us/windows/wsl/install-win10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
    
2.  Once the WSL feature is enabled, install a Linux distribution from the Microsoft Store.
    
3.  Open the Linux terminal and update the package manager's package index:
**`sudo apt-get  update`**

5.  Install ansible using the package manager:
**`sudo apt-get install ansible`**

6.  Verify the installation by running the following command:
	**`ansible --version`**
 
Run the Ansible Playbook. Be sure to move the users.txt to the necessary file path on your machine. Update this path within the Ansible playbook.

## “Dirty COW” / “DIRTY PIPE” CVE

The ***"Dirty COW"*** (CVE-2016-5195) as well as the ***“Dirty Pipe”*** (CVE-2022-0847) are vulnerabilities that affect the Linux kernel and allow a local user to gain root privileges. They were discovered in 2016 and 2022 respectively and have since been patched.

To introduce the ***"Dirty COW"*** vulnerability to a machine, you would need to install a version of the Linux kernel that is affected by the vulnerability.

**Playbook Example:**

    tasks:
    - name:  Install  vulnerable  kernel
      package:
       name:  linux-image-4.8.0-58-generic
       state:  latest
       
This task will use the package module to install the linux-image-4.8.0-58-generic package, which is a version of the Linux kernel that is affected by the ***"Dirty COW"*** vulnerability.

  

## USER Generator

Creating 30 users from a text file in your ansible playbook we will use the module **`with_items`** loop.

 -  First, create a text file called users.txt that contains the list of users you want to create. Each user should be on a separate line.

 -  In your playbook, you can add the following task to create the users:
```
 tasks:
  - name: Create users from text file
    user:
      name: "{{ item }}"
      password: "{{ 'temporary' | password_hash('sha512') }}"
      update_password: always
    with_items: "{{ lookup('file', 'users.txt') }}"
```
  
  

This task creates a user for each line in the users.txt file. It uses the user module.

  

### User.txt:

```
User1

User2

User3

User4

User5

......

User30

```
The password parameter creates a temporary password that will be hashed using the sha512 algorithm. The update_password parameter tells ansible to update the password whenever the task is run.

The **`with_items`** loop iterates over the list of users in the users.txt file, creating a user for each one.

  

## Web Server

1.  We will use Apache for the webserver. First we need to install the Apache software to our Bare-Metal machine.
    

```
tasks:
- name:  Install web server  software
  apt:
   name:  apache2
   state:  present
```
The task uses the apt module to install the apache2 package, which provides the Apache web server.

2.  The template module is used to configure the web server.
    
3.  Restart Apache such that updates are applied.
    

## Capture The Flag

There is a flag.txt file that is placed in the /var/www/html folder. You need to find a way to use the ‘Dirty COW’ exploit to gain access to this file and expose its content. This is an exercise that should be performed from a user on the server that is not root or does not have root privileges.

### How to Exploit “DIRTY COW”

To exploit the "Dirty COW" vulnerability on a Linux machine, you would need to have access to a user account on the machine, and the machine would need to be running a version of the Linux kernel that is affected by the vulnerability.

Here is a high-level overview of the steps that you can follow to exploit the "Dirty COW" vulnerability:

1.  Check the version of the Linux kernel using the **`uname -r`** command.
    
2.  Check if the machine is vulnerable to the ***"Dirty COW"*** vulnerability: [https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-5195](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-5195)
    
3.  If the machine is vulnerable,use exploit tools or personal scripting capabilities. Exploit tool example: [https://dirtycow.ninja/](https://dirtycow.ninja/)


