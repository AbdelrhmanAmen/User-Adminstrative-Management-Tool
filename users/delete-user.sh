#This script is used to delete existing user from the system

while true; do
    username=$(whiptail --inputbox "Enter username to delete :" 8 39 "${username}" \
        --title "Delete User" 3>&1 1>&2 2>&3)
    if [ $? != 0 ]; then
        source manage-user.sh
        exit
    fi

    ## Check if empty user is entered.
    if [ "$username" == "" ]; then
        whiptail --title "Error" --msgbox "Empty username, please try again." 8 78

    else
        # Check if user doesn't exist
        id $username >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            whiptail --title "Error" --msgbox "There is no user named $username, please try again." 8 78
        else
            userdel -r $username
            whiptail --title "Success" --msgbox "User deleted successfully" 8 78
            source menu.sh;exit
        fi
    fi
done
