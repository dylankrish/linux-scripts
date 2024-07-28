#!/usr/bin/sudo /bin/bash

# install epel
dnf config-manager --set-enabled crb
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y

# add packages
dnf install htop vim -y

# enable auto update
dnf install dnf-automatic kpatch kpatch-dnf -y
dnf kpatch auto
# change upgrade type to security, apply_updates to yes, reboot to when-needed
sed -i 's/^upgrade_type = default/upgrade_type = security/' "/etc/dnf/automatic.conf"
sed -i 's/^apply_updates = no/apply_updates = yes/' "/etc/dnf/automatic.conf"
sed -i 's/^reboot = never/reboot = when-needed/' "/etc/dnf/automatic.conf"
systemctl enable --now dnf-automatic.timer

dnf update -y
dnf -y install podman podman-docker podman-tui

# enable podman services
systemctl enable --now podman.socket
systemctl enable --now podman-auto-update.timer

echo "Done"
