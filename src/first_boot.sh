#!/bin/bash

# generate ssh key
ssh-keygen -q -t edcsa -N '' -f /root/.ssh/id_edcsa
cp /root/.ssh/id_edcsa.pub  /root/.ssh/authorized_keys 

git clone https://github.com/monsrud/ubuntu-autoinstall.git
cd ubuntu-autoinstall/ansible
ansible-playbook -i hosts main.yml


