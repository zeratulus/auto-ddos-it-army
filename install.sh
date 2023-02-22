#!/usr/bin/env bash

sudo apt update
sudo apt upgrade
sudo apt install git vim curl gnome-system-monitor

sudo chmod +x ./auto-ddos.sh
sudo chmod +x ./start-ddos.sh

#protonvpn
curl -o ./protonvpn-repo.deb https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb
sudo dpkg -i ./protonvpn-repo.deb
sudo apt update
sudo apt install protonvpn gnome-shell-extension-appindicator gir1.2-appindicator3-0.1

#db1000n
cd ~
git clone https://github.com/Arriven/db1000n.git
cd ./db1000n
sudo chmod +x ./install.sh
./install.sh
sudo chmod +x ./db1000n
