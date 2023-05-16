#!/bin/bash
#
# User List Option


users=$(awk -F: '{if ($7 != "/bin/bash" && $7 != "/usr/bin/bash") {print "UID", $3, ":", $1} else {print "UID", $3, ":", $1, "(bash shell user)"; login++}} END {print "\n#########################\n"; print "Number of users:", NR"\nNumber of bash shell users:", login"\nNumber of non-bash shell users:", NR-login}' /etc/passwd)

whiptail --title "List of Users" --msgbox "$users" 25 50 --scrolltext

menu.sh; exit
