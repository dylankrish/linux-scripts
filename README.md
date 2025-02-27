# Linux Scripts

## Clone all scripts
```bash
git clone https://github.com/dylankrish/linux-scripts.git
```

## Harden SSH
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/ssh-harden.sh | bash
```

## [Fedora] Set up Auto Updates
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/fedora-autoupdate.sh | sudo bash
```

## [RHEL] Set up Auto Updates + Kernel Patching
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/el-autoupdate.sh | sudo bash
```

## [RHEL] Install Packages on Enterprise Linux
```bash
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

# install cockpit
sudo dnf install cockpit cockpit-packagekit cockpit-pcp cockpit-podman cockpit-storaged -y
```
