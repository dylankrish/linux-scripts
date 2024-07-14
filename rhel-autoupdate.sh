#!/bin/bash

sudo dnf install dnf-automatic kpatch-dnf -y

sudo dnf config-manager --set-enabled crb
sudo dnf install epel-release -y