#!/bin/bash


echo -e "\e[0;31m"
echo "***********************************************************************************************************"
echo " ██▀███   ▄▄▄       ███▄    █ ▓█████▄  ▒█████   ███▄ ▄███▓ ██▓▒███████▒▓█████  ██▀███  ";
echo "▓██ ▒ ██▒▒████▄     ██ ▀█   █ ▒██▀ ██▌▒██▒  ██▒▓██▒▀█▀ ██▒▓██▒▒ ▒ ▒ ▄▀░▓█   ▀ ▓██ ▒ ██▒";
echo "▓██ ░▄█ ▒▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌▒██░  ██▒▓██    ▓██░▒██▒░ ▒ ▄▀▒░ ▒███   ▓██ ░▄█ ▒";
echo "▒██▀▀█▄  ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌▒██   ██░▒██    ▒██ ░██░  ▄▀▒   ░▒▓█  ▄ ▒██▀▀█▄  ";
echo "░██▓ ▒██▒ ▓█   ▓██▒▒██░   ▓██░░▒████▓ ░ ████▓▒░▒██▒   ░██▒░██░▒███████▒░▒████▒░██▓ ▒██▒";
echo "░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒ ░ ▒░▒░▒░ ░ ▒░   ░  ░░▓  ░▒▒ ▓░▒░▒░░ ▒░ ░░ ▒▓ ░▒▓░";
echo "  ░▒ ░ ▒░  ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒   ░ ▒ ▒░ ░  ░      ░ ▒ ░░░▒ ▒ ░ ▒ ░ ░  ░  ░▒ ░ ▒░";
echo "  ░░   ░   ░   ▒      ░   ░ ░  ░ ░  ░ ░ ░ ░ ▒  ░      ░    ▒ ░░ ░ ░ ░ ░   ░     ░░   ░ ";
echo "   ░           ░  ░         ░    ░        ░ ░         ░    ░    ░ ░       ░  ░   ░     ";
echo "                               ░                              ░                        ";
echo -e "				Author: Abhijeet Kumar"
echo -e "				Github: https://github.com/wand3rlust"
echo "***********************************************************************************************************"
echo "                                                                                                           "
echo -e "\e[0;34mThis script has been tested on Debian and will work on most of its derivates."
echo "                                                                                                           "
echo "Usage: sudo ./randomizer.sh OR sudo bash randomizer.sh"
echo "                                                                                                           "
echo "***********************************************************************************************************"


FILE1=/etc/NetworkManager/conf.d/randommac.conf
FILE2=/etc/NetworkManager/conf.d/dhclient.conf

cat >$FILE1<<EOF
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
connection.stable-id=${CONNECTION}/${BOOT}
EOF

echo "                                                                                                           "
echo "Congratulations your MAC Address is now randomized which will change with each reboot/connection."
echo "                                                                                                           "

cat >$FILE2<<EOF
[main]
dhcp=dhclient
EOF

echo "                                                                                                           "
echo 'To prevent your hostname from being sent to router, goto "/etc/dhcp/dhclient.conf" and commentout (add "#") to line starting with "send host-name = gethostname();"'
echo "                                                                                                           "
echo "Please REBOOT your system for changes to take place."
echo "                                                                                                           "
echo "***********************************************************************************************************"
