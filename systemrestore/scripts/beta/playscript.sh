#!/bin/bash
#set -e

#HERE WE SET OUR REPO VARIABLES FOR THE SCRIPT

#Repo Key Variable
REPOKEY='FBA220DFC880C036'

#Key Server
KEYSERVER='keyserver.ubuntu.com'

#Mirrorlist
MIRRORLIST='https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

#Check if the key is already installed
KEYCHECK=$(sudo pacman-key --list-keys)

#Add Repo to pacman conf file
APPEND='
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist'

function print_status() {
    tput setaf 4
    echo
    echo $1
    echo
    tput sgr0    
}

if grep -q "$REPOKEY" <<< "$KEYCHECK" ; then

    print_status ">>... The Repo Key Already Exists!! Exiting Script."
    print_status ">>... Receiving the key $REPOKEY ...."

else 

    print_status ">>... Receiving the key $REPOKEY ...."

#sudo pacman-key --recv-key $REPOKEY  --keyserver $KEYSERVER 

sleep 1
fi


# BECHE=1

# if [ $BECHE -eq 1 ] ; then 
# echo "The Variable is 1"
# fi



# STRING="Friday"
# if [ "$STRING" = "Friday" ] ; then
# echo "It's Friday Muddasucka!"
# else
# echo "Keep slaving Muddasucka!"
# fi


# STRING="FRIDAY"
# if [ "$STRING" != "Monday" ] ; then
#     echo "At least it's not Monday"
#     fi

# filename="$HOME"
# if [ -f "$filename" ] ; then
#     echo "$filename is a regular file"
# elif [ -d "$filename" ] ; then 
#     echo "$filename is a directory"
# else
#     echo "I have no idea what $filename is"
# fi    
