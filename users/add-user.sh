
    while true; do
        username=$(whiptail --inputbox "Enter the new username:" 8 39 "${username}" \
        --title "Add User" 3>&1 1>&2 2>&3)
        if [ $? != 0 ]; then menu.sh; exit; fi
        if [ -z "$username" ]; then
            ## If the user entered an empty username.
            whiptail --title "Error" --msgbox "Empty username, try again." 8 78
        else
            id $username >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                whiptail --title "Error" --msgbox "Duplicate username, try again." 8 78
            else
                source adduser $username
                whiptail --title "Success" --msgbox "User added successfully" 8 78
                source menu.sh;exit
            fi
        fi	
    done
