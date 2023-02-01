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


#Find all network interfaces
INTERFACES=$(ip link show | grep -o '^[0-9]: .*' | awk '{print $2}' | sed 's/://')

for INTERFACE in $INTERFACES; 
do

#Find current MAC address
  CURRENT_MAC=$(ifconfig $INTERFACE | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')

# Generate new MAC address
  NEW_MAC=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')

# Change MAC address
  ifconfig $INTERFACE down
  ifconfig $INTERFACE hw ether $NEW_MAC
  ifconfig $INTERFACE up

# Print old & new MAC addresses in terminal
  NEW_MAC=$(ifconfig $INTERFACE | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
  echo "MAC address for $INTERFACE changed from $CURRENT_MAC to $NEW_MAC"
done
