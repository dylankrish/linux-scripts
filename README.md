# Linux Scripts

## Clone all scripts
```
git clone https://github.com/dylankrish/linux-scripts.git
```

## Harden SSH
```
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/ssh-harden.sh | bash
```

## [Fedora] Set up Auto Updates
```
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/fedora-autoupdate.sh | sudo bash
```

## [RHEL] Set up Auto Updates + Kernel Patching
```
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/el-autoupdate.sh | sudo bash
```

## [RHEL] Install Packages on Enterprise Linux
```
# install epel
sudo dnf config-manager --set-enabled crb
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y

# add packages
sudo dnf install htop vim git -y

sudo dnf update -y
sudo dnf -y install podman podman-docker podman-tui

# enable podman services
sudo systemctl enable --now podman.socket
sudo systemctl enable --now podman-auto-update.timer
```
