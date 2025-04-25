#!/usr/bin/sudo /bin/bash

apt-get install unattended-upgrades apt-listchanges -y

set -e # exit script if error
set -x # show executed commands

sudo apt update
sudo apt install -y unattended-upgrades apt-listchanges

sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure --priority=low unattended-upgrades

echo "Configure sources"

sudo tee /etc/apt/apt.conf.d/50unattended-upgrades > /dev/null <<EOF
Unattended-Upgrade::Allowed-Origins {
    "\${distro_id}:\${distro_codename}-security";
    // "\${distro_id}:\${distro_codename}-updates";
    // "\${distro_id}:\${distro_codename}-backports";
};

Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Automatic-Reboot "false";
// Unattended-Upgrade::Mail "your-email@example.com";
// Unattended-Upgrade::MailOnlyOnError "true";
EOF

echo "Set update frequency"

sudo tee /etc/apt/apt.conf.d/20auto-upgrades > /dev/null <<EOF
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
EOF


echo "Complete! Test with sudo unattended-upgrade --dry-run --debug"
