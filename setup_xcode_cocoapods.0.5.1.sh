# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_xcode_cocoapods.0.5.1.sh                     :+:      :+:    :+:    #
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
echo "\nThis script points \n- your Developer folder to your goinfre (local partition) \n- and your cocoapods in your sgoinfre (network drive)"
echo "currently those folders are"
ls -al ~ | grep cocoapods
ls -al ~/Library | grep Developer

echo "\n!!!!!!!!!! Beware !!!!!!!!!\n\nthis script will remove your local home cocoapods install.\nIf you did not already install the cocoapods in \n/sgoinfre/goinfre/Perso/XLOGIN/.cocoapods/\nyou will have to do so afterwards.\n" 
read -p ">>> Do you wish to run the script (y/N)? " answer
case ${answer:0:1} in
    [yY]* )
        echo "Ok, let's get started!" && break;
    ;;
    * )
        echo "Bye" && exit;
    ;;
esac
echo "Ok, we'll change your softlinks."
#quit xcode

echo "############################################"
echo "Quitting XCode and Simulator... (give it 5-10 seconds)"
osascript -e 'quit app "Xcode"'
osascript -e 'quit app "Simulator"'

sleep 7
login=`whoami`
echo $login
#rm -rf /goinfre/$login
mkdir -p /goinfre/$login
echo "############################################"
echo "- changing cocoapods link to sgoinfre"
rm -rf ~/.cocoapods
#rm -rf /goinfre/$login/.cocoapods
mkdir -p /sgoinfre/goinfre/Perso/$login/.cocoapods/
ln -s /sgoinfre/goinfre/Perso/$login/.cocoapods/ ~/.cocoapods
echo "Pods permanent location changed, here it is:"
ls -al ~ | grep cocoapods

echo "############################################"
echo "- changing Developer link to goinfre"
#rm -rf /Users/$login/Library/Developer
rm -rf ~/Library/Developer
#rm -rf /goinfre/$login/Developer
mkdir -p /goinfre/$login/Developer
ln -s /goinfre/$login/Developer/ ~/Library/Developer

echo "removing the simulators"
xcrun simctl delete unavailable
xcrun simctl erase all
echo "Developer folder location changed, here it is:"
ls -al ~/Library | grep Developer

echo "############################################"
echo "======== SIMULATORS ======== "
echo "Note that you need to re-install each previous simulator if you have moved to a different Mac !"
echo "In Xcode: \n- - Xcode menu > Open developer tools > Simulator" 
echo "In Simulator: \n - Menu Devices > Manage devices > tab: Simulators \n - The window opens: Delete the simulator you want, and add it back"
echo "############################################"
echo "======== COCOAPODS ======== "
echo "Note that this assumes that your cocoapods have been installed in /sgoinfre/goinfre/Perso/$login/.cocoapods/ > As SGoinfre is a network drive, the initial Cocoapods install process (to run after you have changed the .cocoapods location) is quite slow." 

echo "############################################"
