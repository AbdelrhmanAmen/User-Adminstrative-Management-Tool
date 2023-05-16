CHOICE=$(whiptail --title "Menu example" --menu "Choose user management option" 25 78 16 \
"<-- Back" "Return to the main menu." \
"Add User" "Add a user to the system." \
"Modify User" "Modify an existing user." \
"List Users" "Show details about an existing user." \
"Delete User" "Delete an existing user." 3>&1 1>&2 2>&3)

case $CHOICE in
    "Add User")
                add-user.sh
        ;;
    "Modify User")
                modify-user.sh
        ;;
    "List Users")
                show-user.sh	
        ;;
    "Delete User")
                delete-user.sh
        ;;
    "<-- Back")
		menu.sh
esac
