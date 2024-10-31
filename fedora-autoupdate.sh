#!/usr/bin/sudo /bin/bash

# enable auto update
dnf update -y
dnf install dnf-automatic

# change upgrade type to security, apply_updates to yes, reboot to when-needed
sed -i 's/^upgrade_type = default/upgrade_type = security/' "/etc/dnf/automatic.conf"
sed -i 's/^apply_updates = no/apply_updates = yes/' "/etc/dnf/automatic.conf"
sed -i 's/^reboot = never/reboot = when-needed/' "/etc/dnf/automatic.conf"
systemctl enable --now dnf-automatic.timer