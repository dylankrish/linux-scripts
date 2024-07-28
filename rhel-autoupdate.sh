#!/usr/bin/sudo /bin/bash

# add packages
dnf install htop vim -y

# enable auto update
dnf install dnf-automatic kpatch-dnf -y
vim /etc/dnf/automatic.conf

# enable package auto update timer
systemctl enable --now dnf-automatic.timer

# install epel
dnf config-manager --set-enabled crb
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

dnf update
dnf -y install podman podman-docker podman-tui

# enable podman auto update timer
systemctl enable --now podman-auto-update.timer

echo "Done"
