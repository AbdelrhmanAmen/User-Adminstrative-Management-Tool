while true; do
 groupname=$(whiptail --inputbox "Enter group name to delete :" 8 39 "${groupname}" \
        --title "Delete Group" 3>&1 1>&2 2>&3)
    
if [ -z "$groupname" ]; then    
    ## If empty group name is entered 
    whiptail --title "Error" --msgbox "Empty Group Name, try again." 8 78
else
  getent group ${groupname} > /dev/null 2>&1

    if [ $? -eq 0 ] ; then
        groupdel ${groupname} >/dev/null 2>&1
        if [ $? -ne 0 ] ;then
            whiptail --title "Error" --msgbox "$groupname is already a primary group" 8 78
            source manage-group.sh; exit
        else 
            whiptail --title "Success" --msgbox "$groupname has been deleted successfully" 8 78
            source menu.sh; exit
        fi

    else
     whiptail --title "Error" --msgbox "There is no group named $groupname, please try again." 8 78
       
    fi   
fi 
done