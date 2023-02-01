# randomizer.sh

Usage: `sudo ./randomizer.sh OR sudo bash randomizer.sh`

Simple Bash script to randomize MAC address of all interfaces. After running the script if you see permissions errors, please check your privileges. On laptops/desktops, `Anacron` can be configured to make sure this script runs with every reboot.

Once executed, this script will find all available network interfaces; loop through each one; change the MAC address and finally print it on terminal for confirmation.

To prevent from the hostname to be shared with the router, goto `/etc/dhcp/dhclient.conf` and commentout (add "#") on line starting with `send host-name = gethostname();`
