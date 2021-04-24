#!/bin/bash

self_dir=$(pwd)

echo "Uninstalling ubuntu-wsl2-systemd-script"

sudo rm -rf /etc/fish/conf.d/start-systemd-namespace.fish
sudo rm -rf /usr/sbin/start-systemd-namespace
sudo rm -rf /usr/sbin/enter-systemd-namespace
sudo rm -rf /etc/sudoers.d/systemd-namespace

cd /var/tmp
# Try bash first.
if [ -f "/etc/bash.bashrc" ]; then
sudo grep -v "# Start or enter a PID namespace in WSL2
source /usr/sbin/start-systemd-namespace" /etc/bash.bashrc > tmpfile
sudo mv tmpfile /etc/bash.bashrc
fi
# Then try zsh.
if [ -f "/etc/zsh/zshrc" ]; then
sudo grep -v "# Start or enter a PID namespace in WSL2
source /usr/sbin/start-systemd-namespace" /etc/zsh/zshrc > tmpfile
sudo mv tmpfile /etc/zsh/zshrc
fi

cd $self_dir
