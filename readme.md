The Latest Linux Mint with xfce4 required or Ubuntu...


1. Preparations:

1.1. Required Linux Mint with XFCE

1.2. Install applications

2. ProtonVPN preparations:

2.1. Install ProtonVPN

2.2. Login

3. Install db1000n

4. Add to startup

5. Troubleshooting

-----

1. Preparations:

Registered Proton VPN account.

Installed Linux Mint with XFCE on your PC.

Go to BIOS and Enable Power On AC Loss.

----



1.2. Install applications

sudo apt update

sudo apt upgrade

sudo apt install git vim gnome-system-monitor


Install this script:

cd ~

git clone https://github.com/zeratulus/auto-ddos-it-army.git

cd ./auto-ddos-it-army

sudo chmod +x ./auto-ddos.sh


----



2.1. Install Proton VPN
Official tutorial for Linux Mint here: https://protonvpn.com/support/official-linux-vpn-mint/


More Linux tutorials here: https://protonvpn.com/support/linux-vpn-setup/


Download and install DEB Package:
https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb

sudo apt update

sudo apt install protonvpn gnome-shell-extension-appindicator gir1.2-appindicator3-0.1


----



2.2. Login into Proton VPN

 Use GUI client and login with your credentials or login with "protonvpn-cli login" command 

----



3. Install db1000n

cd ~
   
git clone https://github.com/Arriven/db1000n.git

cd ./db1000n

sudo chmod +x ./install.sh

./install.sh

sudo chmod +x ./db1000n



----


4. Add to startup

Go to Startup at a main menu.
Click on Add button.

At command field enter:

xfce4-terminal -e "~/auto-ddos-it-army/auto-ddos.sh"

Save.



Some linuxes can`t run this command: 

xfce4-terminal -e "~/auto-ddos-it-army/auto-ddos.sh"


To fix this issue you must fix this to:

xfce4-terminal -e "/home/YOUR_USER_NAME_HERE/auto-ddos-it-army/auto-ddos.sh"


PS. Also, I add gnome-system-monitor to startup to see some net stats.

----

5. Troubleshooting
 - Apps do not start:
    Update shell script with your app path.
   
   
 - Fix problem with DNS names resolve, fix of /etc/resolv.conf (symlink by defaults), this problem can be found when starts protonvpn-cli with connection error, seems like Python take DNS only from reslove, not a net configuration:

   
   sudo rm /etc/resolv.conf
   
   sudo cp ~/auto-ddos-it-army/resolv.conf /etc/resolv.conf
   
   sudo chattr +i /etc/resolv.conf

PS. If your router IP is not 192.168.0.1 then change this line to your router IP in resolv.conf: 

nameserver 192.168.0.1


You can obtain user ID and change it in this script, by default it uses my ID.
For those you need rewrite this line: ~/db1000n/db1000n --user-id=302116940