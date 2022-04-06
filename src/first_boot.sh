#!/bin/bash

# generate ssh key
ssh-keygen -q -t ecdsa -N '' -f ~/.ssh/id_edcsa
cat ~/.ssh/id_ecdsa.pub >> ~/.ssh/authorized_keys
cp ~/.ssh/id_ecdsa.pub  ~/.ssh/authorized_keys 

git clone https://github.com/monsrud/ubuntu-autoinstall.git
cd ubuntu-autoinstall/ansible
ansible-playbook -i hosts main.yml


