# randomizer.sh

Simple Bash script to randomize MAC address. After running the script if you see permissions errors on line 30 & 44 please check your permissions.

Usage: `sudo ./randomizer.sh OR sudo bash randomizer.sh`

This script will also prevent your hostnames from reaching router. 
First part of this functionality is performed by script itself. To perform second part, goto `/etc/dhcp/dhclient.conf` and commentout (add "#") to line starting with `send host-name = gethostname();`
