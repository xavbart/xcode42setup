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
echo "\nThis script points \n- your .android folder to your sgoinfre (local partition) "
echo "currently those folders are"
ls -al ~ | grep android
ls -al ~/Library | grep android

echo "\n!!!!!!!!!! Beware !!!!!!!!!\n\nthis script will remove your local home .android simulator install.\n" 
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
echo "Quitting Android Studio and Simulator... (give it 5-10 seconds)"
osascript -e 'quit app "Android Studio"'
# remove simulator if running #osascript -e 'quit app "Android Simulator"'

sleep 7
login=`whoami`
echo $login
#rm -rf /goinfre/$login
mkdir -p /goinfre/$login


# this wont work as java will nt accept symlink to resources 
##echo "############################################"
##echo "- changing android link to sgoinfre"
##rm -rf ~/.android
#rm -rf /goinfre/$login/.cocoapods
##mkdir -p /sgoinfre/goinfre/Perso/$login/Android/.android/
##ln -s /sgoinfre/goinfre/Perso/$login/Android/.android/ ~/.android
##echo "android permanent location changed, here it is:"
##ls -al ~ | grep android

echo "############################################"
echo "- changing graddle link to sgoinfre"
rm -rf '~/Library/Caches/AndroidStudio3.3'
mkdir -p /sgoinfre/goinfre/Perso/$login/Android/AndroidCache
ln -s /sgoinfre/goinfre/Perso/$login/AndroidCache '~/Library/Caches/AndroidStudio3.3'
echo "gradle permanent location changed, here it is:"
ls -al ~/Library/Caches/ | grep Android

# this wont work as java will nt accept symlink to resources 
##echo "############################################"
##echo "- changing AS cache link to sgoinfre"
##rm -rf ~/.gradle
##mkdir -p /sgoinfre/goinfre/Perso/$login/Android/.gradle/
##ln -s /sgoinfre/goinfre/Perso/$login/Android/.gradle/ ~/.gradle
##echo "gradle permanent location changed, here it is:"
##ls -al ~ | grep android

##echo "############################################"
##echo "- changing Developer link to goinfre"
#rm -rf /Users/$login/Library/Developer
##rm -rf ~/Library/Developer
#rm -rf /goinfre/$login/Developer
##mkdir -p /goinfre/$login/Developer
##ln -s /goinfre/$login/Developer/ ~/Library/Developer

##echo "removing the simulators"
##xcrun simctl delete unavailable
##xcrun simctl erase all
##echo "Developer folder location changed, here it is:"
##ls -al ~/Library | grep Developer


##echo "############################################"
##echo "======== SIMULATORS ======== "
##echo "Note that you need to re-install each previous simulator if you have moved to a different Mac !"
##echo "In Xcode: \n- - Xcode menu > Open developer tools > Simulator" 
##echo "In Simulator: \n - Menu Devices > Manage devices > tab: Simulators \n - The window opens: ##Delete the simulator you want, and add it back"
##echo "############################################"
##echo "======== COCOAPODS ======== "
##echo "Note that this assumes that your cocoapods have been installed in /sgoinfre/goinfre/Perso/$login/.cocoapods/ > As SGoinfre is a network drive, the initial Cocoapods install process (to run after you have changed the .cocoapods location) is quite slow." 

##echo "############################################"
