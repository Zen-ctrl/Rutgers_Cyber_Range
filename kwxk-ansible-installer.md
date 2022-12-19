# Ansible installation script

This script installs ansible, checks the version of ansible, installs the latest version of Python, and includes the update feature for ansible.

## Prerequisites

-   The necessary package managers must be installed on the system:
    -   Linux: `apt-get`
    -   Windows: `Chocolatey`
    -   macOS: `Homebrew`

## Installation

1.  Download the script by running the following command:
```bash
curl https://raw.githubusercontent.com/kwxk/Rutgers_Cyber_Range/master/kwxk-ansible-installer.sh -o kwxk-ansible-installer.sh
```

```bash
wget https://raw.githubusercontent.com/kwxk/Rutgers_Cyber_Range/master/kwxk-ansible-installer.sh -o kwxk-ansible-installer.sh
```
2.  Make the script executable by running the following command:
```bash 
chmod +x kwxk-ansible-installer.sh
```

3.  Run the script by typing `./kwxk-ansible-installer.sh` and pressing Enter.
    
4.  The script will prompt you to enter your operating system (`linux`, `windows`, or `MACOS`).
    
5.  The script will install ansible, check the version of ansible, install the latest version of Python, and confirm the installation of ansible.
    

## Update feature

To update ansible, run the script again and enter your operating system when prompted. The script will update ansible to the latest version.

## Troubleshooting

-   If you encounter an error while running the script, make sure that the necessary package managers are installed on your system.
-   If the script fails to install ansible, check the output for any error messages and try to resolve the issue based on the error message.
-   If the script fails to install the latest version of Python, make sure that the necessary dependencies are installed on your system.
-   If the script fails to update ansible, make sure that you have the latest version of the package manager installed on your system.
