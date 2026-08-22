#!/bin/bash

# run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Exiting..."
   exit 1
fi

set -e # exit script if error
set -x # show executed commands

# enable auto update
dnf update -y
dnf install dnf-automatic -y

# copy dnf automatic config to editable directory
cp /usr/share/dnf5/dnf5-plugins/automatic.conf /etc/dnf/automatic.conf

# change upgrade type to security, apply_updates to yes, reboot to when-needed
sed -i 's/^upgrade_type = default/upgrade_type = security/' "/etc/dnf/automatic.conf"
sed -i 's/^apply_updates = no/apply_updates = yes/' "/etc/dnf/automatic.conf"
sed -i 's/^reboot = never/reboot = when-needed/' "/etc/dnf/automatic.conf"
systemctl enable --now dnf-automatic.timer
