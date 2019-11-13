# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_xcode_NOcocoapods.0.5.1.sh                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xbarthe <xbarthe@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/04 15:03:44 by xbarthe           #+#    #+#              #
#    Updated: 2019/04/04 15:03:44 by xbarthe          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

VERSION="0.5.1"
echo "======== XCode environment shortcuts, for 42 limited home folder space config ========"
echo "Version : $VERSION"
echo "\nThis script points \n- your Developer folder to your goinfre (local partition) \n- It does not touches your cocoapods install."
echo "currently those folders are"

ls -al ~/Library | grep Developer

echo "\n!!!!!!!!!! Beware !!!!!!!!!\n\nthis script will remove your LIbrary Developer folder.\nIt will not touch the cocoapods home folder\n" 
read -p ">>> Do you wish to run the script (y/N)? " answer
case ${answer:0:1} in
    [yY]* )
        echo "Ok, let's get started!" && break;
    ;;
    * )
        echo "Bye" && exit;
    ;;
esac
echo "Now we'll change your softlinks."
#quit xcode

echo "############################################"
echo "Quitting XCode and Simulator... (give it 10 seconds)"
osascript -e 'quit app "Xcode"'
osascript -e 'quit app "Simulator"'
sleep 10
login=`whoami`
echo $login


echo "############################################"
echo "- changing Developer link to goinfre"
#rm -rf /Users/$login/Library/Developer
echo "> removing ~/Library/Developer/"
rm -rf ~/Library/Developer
echo "> ln -s /goinfre/$login/Developer/ ~/Library/Developer"
mkdir -p /goinfre/$login/Developer
ln -s /goinfre/$login/Developer/ ~/Library/Developer
echo "Developer folder location changed, here it is:"
ls -al ~/Library | grep Developer

echo "############################################"
echo "======== SIMULATORS ======== "
echo "Note that you need to re-install each previous simulator if you have moved to a different Mac !"
echo "In Xcode: \n- - Xcode menu > Open developer tools > Simulator" 
echo "In Simulator: \n - Menu Devices > Manage devices > tab: Simulators \n - The window opens: Delete the simulator you want, and add it back"
echo "############################################"
echo "======== COCOAPODS ======== "
echo "You could also install cocoapods in /sgoinfre/goinfre/Perso/$login/.cocoapods/ > As SGoinfre is a network drive, the initial Cocoapods install process \n(to run after you have changed the .cocoapods location) is quite slow." 

echo "############################################"
