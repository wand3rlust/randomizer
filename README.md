# randomizer.sh

Simple Bash script to randomize MAC address. After running the script if you see permissions errors on lines 30 & 44 please check your permissions. You only need to run this script once to avail all features. WIth each boot/connection your MAC address will be changed without executing this script every time.

Usage: `sudo ./randomizer.sh OR sudo bash randomizer.sh`

This script will also prevent your hostnames from reaching router. 
First part of this functionality is performed by script itself. To perform second part, goto `/etc/dhcp/dhclient.conf` and commentout (add "#") to line starting with `send host-name = gethostname();`
