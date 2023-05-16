CHOICE=$(whiptail --title "Menu example" --menu "Choose management option" 25 78 16 \
"<-- Back" "Return to the main menu." \
"User" "Manage users in the system." \
"Group" "Manage groups in the system" \
"About" "Some information about the program and authors" 3>&1 1>&2 2>&3)

case $CHOICE in
    "User")
        	manage-user.sh
        ;;
    "Group")
        	manage-group.sh
        ;;
    "About")
            about.sh
        ;;
esac
