#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

clear
#banner
echo -e "          ░█▀▀▀█ ░█▀▀▀█ ░█─── ─█▀▀█ ░█▀▀█ 　 ░█▀▀▀█ ░█▀▀▀█ ░█─░█ " | lolcat
echo -e "          ─▀▀▀▄▄ ─▀▀▀▄▄ ░█─── ░█▄▄█ ░█▀▀▄ 　 ─▀▀▀▄▄ ─▀▀▀▄▄ ░█▀▀█ " | lolcat
echo -e "          ░█▄▄▄█ ░█▄▄▄█ ░█▄▄█ ░█─░█ ░█▄▄█ 　 ░█▄▄▄█ ░█▄▄▄█ ░█─░█ " | lolcat

echo ""
echo ""
echo ""
allusers=$(awk -F: '$3>=1000 {print $1}' /etc/passwd | grep -v nobody)
echo -e "${GREEN}$allusers${ENDCOLOR}"
echo""
echo""

#deluser
echo -ne "${YELLOW}Enter the Name of the User to be deleted : "; read username
while true; do
    read -p "Do you want to Delete The User $username ? (Y/N) " yn
    case $yn in
        [Yy]* ) userdel $username && echo "" && echo -e "${RED}User $username deleted ${ENDCOLOR}" || echo -e "${RED}Failed to delete user  $username ${ENDCOLOR}"; break;;
        [Nn]* ) echo -e "${RED}\nDelete cancelled.${ENDCOLOR}"&&break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo -e "\nPress Enter key to return to main menu"; read
menu
