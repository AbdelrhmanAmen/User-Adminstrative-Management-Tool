CHOICE=$(whiptail --title "Menu example" --menu "Choose user management option" 25 78 16 \
"<-- Back" "Return to the main menu." \
"Create Group" "Add new group to the system." \
"Remove Group" "Remove an existing group from the system" \
"Add User" "Add user to group in the system"  3>&1 1>&2 2>&3)

case $CHOICE in
    "Create Group")
               	create-group.sh
        ;;
    "Remove Group")
                remove-group.sh
        ;;
    "Add User")
                add-guser.sh    
        ;;
    "<-- Back")
               	menu.sh
        ;;
esac
