#!/bin/bash

# run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Exiting..."
   exit 1
fi

# enable auto update and live patching
dnf update -y
dnf install dnf-automatic kpatch kpatch-dnf -y
dnf kpatch auto

# change upgrade type to security, apply_updates to yes, reboot to when-needed
sed -i 's/^upgrade_type = default/upgrade_type = security/' "/etc/dnf/automatic.conf"
sed -i 's/^apply_updates = no/apply_updates = yes/' "/etc/dnf/automatic.conf"
sed -i 's/^reboot = never/reboot = when-needed/' "/etc/dnf/automatic.conf"
systemctl enable --now dnf-automatic.timer