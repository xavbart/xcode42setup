#!/bin/bash
echo "Beware this script will remove your local home cocoapods install> If you did not already install the cocoapods in sgoinfre, you will have to" 
read -p "Do you wish to run the script (y/N)? " answer
case ${answer:0:1} in
    [yY]* )
        echo "Ok, let's get started!" && break;
    ;;
    * )
        echo "Bye" && exit;
    ;;
esac
echo "Running script"