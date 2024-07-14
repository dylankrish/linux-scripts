#!/bin/bash

sudo dnf install dnf-automatic -y

sudo dnf config-manager --set-enabled crb
sudo dnf install epel-release -y