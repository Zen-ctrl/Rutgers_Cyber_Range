
# Rutgers ITI InfoSec | Scarlet Castle Cyber-Range
### Cloud Instances and Baremetal
---
# Use the KWXK Ansible Installer Shell Script on your machine first.
[Linux](https://github.com/kwxk/Rutgers_Cyber_Range/tree/main/Bare%20Metal%20Setup%20-%20Rutgers%20Cyber%20Range/baremetal%20setup%20installer)
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

#### The the cyber range is designed forRed Hat-based Linux distributions such as CentOS and Fedora. These distributions use the yum package manager to install and manage software packages.

If you are using a different type of Linux distribution, the package manager and repository structure may be different, so you may need to modify the scripts accordingly.

## Ansible

Ansible is an automation tool that enables the execution of tasks on multiple systems simultaneously. It allows users to define instructions in the form of playbooks, which can be executed on targeted systems to automate processes and reduce the workload. Ansible is a useful tool for streamlining the configuration and management of large numbers of systems, providing an efficient means of automating repetitive tasks and reducing the potential for human error.

### main.yml
Here is a breakdown of the tasks:

1.  Install dependencies: This task installs several packages (wget, make, gcc, kernel-headers, kernel-devel, and libtermcap-devel) using the `yum` module.
    
2.  Create group: This task creates a group called "usersgroup" using the `group` module.
    
3.  Install Apache: This task installs the Apache web server package using the `yum` module.
    
4.  Start Apache: This task starts the Apache web server using the `service` module.
    
5.  Enable Apache: This task enables the Apache web server to start automatically on system boot using the `service` module.
    
6.  Create users: This task creates a list of users specified in the file "users.txt" using the `user` module. It sets the shell to /bin/bash and the home directory to /srv/{{item}}, where {{item}} is the username. It also generates an SSH key for each user and adds them to the "usersgroup" group.
    
7.  Set password to users: This task sets the password for the users in the list to "root" using the `shell` module and the `chpasswd` command. The `no_log` option is used to prevent the password from being logged in the playbook output.
    
8.  Check if file exists: This task checks if the file "linux-4.8.tar.xz" exists using the `stat` module. The result is stored in the `file_stat` variable.
    
9.  Download kernel source code: This task downloads the kernel source code from the specified URL using the `command` module and the `wget` command. The `when` clause specifies that this task should only run if the file does not exist (as determined by the previous task).
    
10.  Create restricted file: This task creates a file called "restricted.txt" using the `lineinfile` module and adds a single line of text to it.
    
11.  Set ownership and permissions of restricted file: This task sets the ownership and permissions of the "restricted.txt" file using the `file` module. It sets the owner to "root" and the group to "root", and sets the file permissions to 0640 (read and write for owner, read-only for group and others).



## Set Up Details
To run this playbook, you will need to follow these steps:

1.  Make sure that you have Ansible installed on your machine. You can install it using the following command:
	 ```pip install ansible```
	 [or just run this](https://github.com/kwxk/Rutgers_Cyber_Range/blob/main/Bare%20Metal%20Setup%20-%20Rutgers%20Cyber%20Range/baremetal%20setup%20installer/linux-installer.sh)
2.  Make sure that the inventory file (`inventory.txt`) and the playbook file (`main.yml`) are in the same directory.
    
3.  (Optional) If you are using the `vars_files` parameter to specify a variable file (`vars.yml`) in the playbook, make sure that the variable file is in the same directory as the playbook.
    
4.  Open a terminal window and navigate to the directory where the playbook and inventory file are located.
    
5.  Run the following command to execute the playbook:
```ansible-playbook -i inventory.txt main.yml```

6.  (Optional) If you are using the **`vars_files`** parameter in the playbook, you can specify the variables file using the `--extra-vars` flag as follows:
```ansible-playbook -i inventory.txt main.yml --extra-vars "@vars.yml" ```

Note: The `ansible-playbook` command will execute the playbook on the hosts specified in the inventory file. In this case, the playbook is targeting the `localhost`, so it will execute on the machine where the playbook is being run.

If you want to target the a remote machine, in the ```main.yml``` file, remove the comments from the **```vars_files```** and **```vars:```** block so that ansible can target the remote machines listed in your ```inventory.txt``` file.


## AFTER THE PLAYBOOK HAS RUN...

## Run the kernel down grade shell script when finished with the playbook
#### [kernel_change_4.8.sh](https://github.com/kwxk/Rutgers_Cyber_Range/blob/main/Bare%20Metal%20Setup%20-%20Rutgers%20Cyber%20Range/kernel_change_4.8.sh)


```
tar xvf linux-4.8
cd linux-4.8
# input the prompted 
sudo make oldconfig
sudo make install
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot
```
 
---

## “Dirty COW” / “DIRTY PIPE” CVE

The ***"Dirty COW"*** (CVE-2016-5195) as well as the ***“Dirty Pipe”*** (CVE-2022-0847) are vulnerabilities that affect the Linux kernel and allow a local user to gain root privileges. They were discovered in 2016 and 2022 respectively and have since been patched.

To introduce the ***"Dirty COW"*** vulnerability to a machine, you would need to install a version of the Linux kernel that is affected by the vulnerability.

**Playbook Example:**

```
  - name: Download kernel source code
    command:  wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.8.tar.xz
    when: file_stat.stat.exists == False
    become: true
```

This task will use the package module to install the linux-image-4.8.0-58-generic package, which is a version of the Linux kernel that is affected by the ***"Dirty COW"*** vulnerability.

  

## USER Generator

Creating  users from a text file in your ansible playbook we  use the module **`loop`**.

```
  - name: Create users
    user: name="{{item}}" shell=/bin/bash home="/srv/{{item}}" groups=usersgroup generate_ssh_key=yes ssh_key_bits=2048
    loop:  "{{ lookup('file', 'users.txt', wantList=True) }}"
  - name: Set password to users
    shell: echo "{{item}}:root" | sudo chpasswd
    no_log: True
    loop:  "{{ lookup('file', 'users.txt', wantList=True) }}"
```
  
### User.txt:

```
['user0','user1', 'user3']

```
The password parameter creates a temporary password that will be hashed using the sha512 algorithm. The update_password parameter tells ansible to update the password whenever the task is run.

The **`loop`** module  iterates over the list of users in the users.txt file, creating a user for each one.

  

## Web Server

1.  We will use Apache for the webserver. First we need to install the Apache software to our Bare-Metal machine.
    

```
tasks:
  - name: install apache
    yum:
      name: httpd
      state: present
  - name: start apache
    service:
      name: httpd
      state: started
  - name: enable apache
    service:
      name: httpd
      enabled: true
```
The task uses the apt module to install the apache2 package, which provides the Apache web server.

2.  The template module is used to configure the web server.
    
3.  Restart Apache such that updates are applied.
    

## Capture The Flag

There is a **```restricted.txt```** file that is placed in the /var/www/html folder. You need to find a way to use the **‘Dirty COW’** exploit to gain access to this file and expose its content. This is an exercise that should be performed from a user on the server that is not root or does not have root privileges.

### How to Exploit “DIRTY COW”

To exploit the "Dirty COW" vulnerability on a Linux machine, you would need to have access to a user account on the machine, and the machine would need to be running a version of the Linux kernel that is affected by the vulnerability.

Here is a high-level overview of the steps that you can follow to exploit the "Dirty COW" vulnerability:

1.  Check the version of the Linux kernel using the **`uname -r`** command.
    
2.  Check if the machine is vulnerable to the ***"Dirty COW"*** vulnerability: [https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-5195](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-5195)
    
3.  If the machine is vulnerable, use exploit tools or personal scripting capabilities. Exploit tool example: [https://dirtycow.ninja/](https://dirtycow.ninja/)
 

## Remember, Run the kernel down grade shell script when finished with the playbook
#### [kernel_change_4.8.sh](https://github.com/kwxk/Rutgers_Cyber_Range/blob/main/Bare%20Metal%20Setup%20-%20Rutgers%20Cyber%20Range/kernel_change_4.8.sh)
