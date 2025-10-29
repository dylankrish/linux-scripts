# Linux Scripts

## Clone all scripts
```bash
git clone https://github.com/dylankrish/linux-scripts.git
```

## Harden SSH
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/ssh-harden.sh | bash
```

## [Debian/Ubuntu] Set up Auto Updates
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/debian-autoupdate.sh | sudo bash
```

## [Fedora] Set up Auto Updates
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/fedora-autoupdate.sh | sudo bash
```

## [RHEL] Set up Auto Updates + Kernel Patching
```bash
curl -sSL https://raw.githubusercontent.com/dylankrish/linux-scripts/refs/heads/main/el-autoupdate.sh | sudo bash
```

## EPEL Extra Packages for Enterprise Linux
Follow https://docs.fedoraproject.org/en-US/epel/

## Install Packages
```bash
# add packages
sudo dnf install htop vim git -y

sudo dnf update -y
sudo dnf -y install podman podman-docker

# enable podman services
sudo systemctl enable --now podman.socket
sudo systemctl enable --now podman-auto-update.timer

# install cockpit
sudo dnf install cockpit cockpit-packagekit cockpit-pcp cockpit-podman cockpit-storaged -y
```
