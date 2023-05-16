about="
*** FOR EDUCATIONAL PURPOSES ***
 
This program is designed to help you to: 
- Manage User (Add user, Modify user, List users, Delete user)
- Manage Group (Add group, List groups, Add user to group, Delete group) 

This script mainly uses **whiptail** to interact with user.
Must run as a root or sudo with suitable permissions.

**Note**
Make sure to add PATH=\$PATH:/(Script path) to be able to run it from any where 



Created By: 
Abdelrhman Amen
Maryam Gad
Mohamed Abdo
Mohamed Alaa
Mohamed Salah


"

whiptail --title "About This Program" --msgbox "$about"  25 80 --scrolltext
menu.sh; exit
