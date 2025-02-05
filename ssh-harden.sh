#!/bin/bash

# remove currently authorized keys
# comment to disable
rm ~/.ssh/authorized_keys

# github username
username=dylankrish

# make .ssh if not created
if [ ! -d "~/.ssh" ]; then
    mkdir ~/.ssh
fi

# get user ssh keys
curl https://github.com/$username.keys | tee -a ~/.ssh/authorized_keys

# disable password auth
sudo sed -i '/^#PasswordAuthentication yes/s/^#//; s/yes/no/' /etc/ssh/sshd_config 

# Restart the SSH service based on the OS
if [[ -f /etc/lsb-release ]]; then
    # for Ubuntu and its derivatives
    sudo systemctl restart ssh
else
    # for other distros (assuming they use sshd)
    sudo systemctl restart sshd
fi