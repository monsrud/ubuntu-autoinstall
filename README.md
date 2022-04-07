
# Ubuntu 20.04 Autoinstall

Generate an ubuntu auto install iso that is configured/customized via cloud-init and Ansible.

**Basic Steps**

- Edit cloud-init/user-data and specify a username and password for the default user

- Add an ssh key for the user in cloud-init/user-data

- Add any configuration changes or package additions in ansible/main.yml
 
- Generate the install iso with bash ./build.sh

- Boot the iso on the system you are installing


Requirements:

- genisoimage must be installed and is used to creates ISO-9660 CD-ROM images

**Generate a password for a user:**

- python3 -c "import crypt; print(crypt.crypt('password'))"


**References:**

- https://ubuntu.com/server/docs/install/autoinstall-reference

- https://louwrentius.com/understanding-the-ubuntu-2004-lts-server-autoinstaller.html



