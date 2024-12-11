#!/usr/bin/sudo /bin/bash

# install epel
dnf config-manager --set-enabled crb
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y

# add packages
dnf install htop vim git -y

dnf update -y
dnf -y install podman podman-docker podman-tui

# enable podman services
systemctl enable --now podman.socket
systemctl enable --now podman-auto-update.timer

echo "Done"
