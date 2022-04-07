#!/bin/bash

# generate ssh key
mkdir -p /root/.ssh
chmod go-rwx /root/.ssh
ssh-keygen -q -t ecdsa -N '' -f /root/.ssh/id_ecdsa
cp /root/.ssh/id_ecdsa.pub  /root/.ssh/authorized_keys 

cd /root/ansible
ansible-playbook -i hosts main.yml


