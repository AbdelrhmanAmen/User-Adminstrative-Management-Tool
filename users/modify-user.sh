#This script is used to delete existing user from the system

while true; do
    username=$(whiptail --inputbox "Enter username to Modify :" 8 39 "" \
        --title "Modify User" 3>&1 1>&2 2>&3)
    if [ $? != 0 ]; then
        manage-user.sh
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
            CHOICE=$(whiptail --title "Modify user: $username" --menu "Choose modification option" 25 78 16 \
                "<-- Back" "Return to the main menu." \
                "Comment" "Add any text as Full name, Email, Phone, etc.." \
                "Expire Date" "The date on which the user account will be disabled" \
                "Lock/Unlock" "Lock or Ulocak user's password" \
                "Password" "Change user's password" \
                "Shell" "The path of the user's new login shell" 3>&1 1>&2 2>&3)

            case $CHOICE in
            "Comment")
                comment=$(whiptail --inputbox "Add Comment To This User" 8 39 "" \
                    --title "Add Comment" 3>&1 1>&2 2>&3)
                if [ $? == 0 ]; then
                    usermod -c "$comment" $username
                fi
                manage-user.sh
                exit
                ;;

            "Expire Date")
                ## needs a condition
                expiredate=$(whiptail --inputbox "Add Date In "YYYY-MM-DD" Format" 8 39 "" \
                    --title "Add Expire Date" 3>&1 1>&2 2>&3)
                if [ $? == 0 ]; then
                    usermod -e $expiredate $username
                fi
                manage-user.sh
                exit
                ;;
            "Lock or Unlock")

                locked=$(grep $username /etc/shadow | awk -F ":" '{if(substr($2,1,1) == "!"){print "True"} else {print "False"}}')
                #check if this user is unlocked

                if [[ $locked == "False" ]]; then
                    whiptail --title "LOCK THIS USER" --yesno "This user is unlocked, Do you want to lock" 8 78
                    if [ $? == 0 ]; then
                        usermod -L $username
                    fi
                    manage-user.sh
                    exit

                else
                    whiptail --title "UNLOCK THIS USER" --yesno "This user is locked, Do you want to unlock" 8 78
                    if [ $? == 0 ]; then
                        usermod -U $username
                    fi
                    manage-user.sh
                    exit
                fi
                ;;
            "Password")
                password=$(whiptail --passwordbox "Add New Password to This User" 8 39 "" \
                    --title "Add New Password" 3>&1 1>&2 2>&3)
                if [ $? == 0 ]; then
                    if [ "$password" == "" ]; then
                        whiptail --title "Error" --msgbox "This is an Empty Passowrd, Try again" 8 78
                    else
                        echo $password | passwd $username --stdin >/dev/null
                    fi
                fi
                manage-user.sh
                exit
                ;;
            "Shell")
                shellType=$(whiptail --inputbox "Add New Shell To This User" 8 39 "" \
                    --title "Change Login Shell" 3>&1 1>&2 2>&3)
                if [ $? == 0 ]; then
                    usermod -s $shellType $username
                fi
                manage-user.sh
                exit
                ;;

            "<-- Back")
                menu.sh
                ;;

            esac

            break
        fi
    fi
done
