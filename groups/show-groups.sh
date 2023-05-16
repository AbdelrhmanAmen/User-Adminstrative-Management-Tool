#!/bin/bash
#
# User List Option


groups=$(awk -F ":" '{print "GID", $3, ":", $1}  END {print "\n#########################\n"; print "Number of groups:", NR}' /etc/group)

whiptail --title "List of groups" --msgbox "$groups" 25 50 --scrolltext

menu.sh; exit
