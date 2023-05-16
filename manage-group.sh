CHOICE=$(whiptail --title "Menu example" --menu "Choose user management option" 25 78 16 \
"<-- Back" "Return to the main menu." \
"Create Group" "Add new group to the system." \
"Remove Group" "Remove an existing group from the system" \
"List Groups" "List all the existing goups in the system" \
"Add User to Group" "Add user to group in the system"  3>&1 1>&2 2>&3)

case $CHOICE in
    "Create Group")
               	create-group.sh
        ;;
    "Remove Group")
                remove-group.sh
        ;;
    "List Groups")
                show-groups.sh
        ;;
    "Add User to Group")
                add-guser.sh    
        ;;
    "<-- Back")
               	menu.sh
        ;;
esac
