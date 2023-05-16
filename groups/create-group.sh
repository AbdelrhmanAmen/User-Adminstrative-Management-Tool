while true; do
    groupname=$(whiptail --inputbox "Enter The New Group Name:" 8 39 "${groupname}" \
        --title "Add Group" 3>&1 1>&2 2>&3)
    if [ $? != 0 ]; then
        menu.sh
        exit
    fi
    if [ -z "$groupname" ]; then
        ## If empty group name is entered 
        whiptail --title "Error" --msgbox "Empty Group Name, try again." 8 78
    else
        getent group $groupname >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            whiptail --title "Error" --msgbox "Duplicate group name, try again." 8 78
        else
            groupadd $groupname
            whiptail --title "Success" --msgbox "Group added successfully" 8 78
            source menu.sh
            exit
        fi
    fi
done
