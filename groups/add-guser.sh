while true; do
    groupname=$(whiptail --inputbox "Enter Group Name:" 8 39 "${groupname}" \
        --title "Add User To Group" 3>&1 1>&2 2>&3)
    if [ $? != 0 ]; then
        menu.sh
        exit
    fi
    if [ -z "$groupname" ]; then
        ## If empty group name is entered
        whiptail --title "Error" --msgbox "Empty Group Name, try again." 8 78
    else
        getent group $groupname >/dev/null 2>&1
        # if there is no group with this name
        if [ $? -ne 0 ]; then
            whiptail --title "Error" --msgbox "There is no group called $groupname, try again." 8 78
        else
            # if there is a group move to second input
            username=$(whiptail --inputbox "Enter User Name:" 8 39 "${username}" \
                --title "Add User To Group" 3>&1 1>&2 2>&3)
            if [ $? != 0 ]; then
                menu.sh
                exit
            fi
            if [ -z "$username" ]; then
                ## If empty user name is entered
                whiptail --title "Error" --msgbox "Empty Username, try again." 8 78
            else
                id $username >/dev/null 2>&1
                if [ $? -ne 0 ]; then
                    whiptail --title "Error" --msgbox "There is no user called $username, try again." 8 78
                else
                    usermod -aG $groupname $username
                    source menu.sh
                    exit
                fi
            fi

        fi
    fi
done
