#!/bin/bash

# generate ssh key
mkdir -p /root/.ssh
chmod go-rwx /root/.ssh
ssh-keygen -q -t ecdsa -N '' -f /root/.ssh/id_ecdsa
cp /root/.ssh/id_ecdsa.pub  /root/.ssh/authorized_keys 

git clone https://github.com/monsrud/ubuntu-autoinstall.git
cd ubuntu-autoinstall/ansible
ansible-playbook -i hosts main.yml


