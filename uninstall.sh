#!/bin/bash

cd2=$(pwd)
echo "Uninstalling ubuntu-wsl2-systemd-hack"
sudo rm -f /usr/sbin/start-systemd-namespace
sudo rm -f /usr/sbin/enter-systemd-namespace
cd /var/tmp
sudo grep -v "source /usr/sbin/start-systemd-namespace" /etc/bash.bashrc > tmpfile && sudo mv tmpfile /etc/bash.bashrc
cd $cd2
