#!/bin/bash

#vsc_market.sh: a script that allows you to change VSCodium's marketplace for VSCode's marketplace
#This script was writtem as practice in bash scripting.
#author: Andres Cornejo

#Color declarations
#https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
nc='\033[0m'

#Text formatting
bold=$(tput bold)
normal=$(tput sgr0)

#Text declaration
o1="https://open-vsx.org/vscode/gallery"
o2="https://open-vsx.org/vscode/item"
n1='https://marketplace.visualstudio.com/_apis/public/gallery'
n2="https://marketplace.visualstudio.com/items"

if [[ $# -eq 0 ]] ; then
    echo "Unknown options given, use -h or --help for help."
    exit 0
fi

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo " "
      echo "${bold}vsc_market.sh: a script that allows you to change VSCodium's marketplace for VSCode's marketplace${normal}"
      echo " "
      echo -e "Usage: ${green}./vsc_market.sh ${blue}[options]${nc}"
      echo " "
      echo "options:"
      echo -e "${blue}-h, --help${nc}                show help dialog"
      echo -e "${blue}-l, --linux${nc}               change the marketplace in Linux ${red}(Must be run with sudo or elevated privileges)${nc}"
      echo -e "${blue}-w, --windows ${nc}            change the marketplace in Windows ${red}(Must run WSL instance as administrator)${nc}"
      echo " "
      echo "Please note that VSCodium has to be installed in the default directory."
      echo "For educational purposes only."
      echo " "
      exit 0
      ;;
    -l|--linux)
      #This is the default directory for VSCodium in Arch Linux.
      linDir="/usr/share/vscodium-bin/resources/app/product.json"
      if [ -w $linDir ]
      then
        # using the '#' delimiter for sed since / causes problems with directories in windows.
        # https://stackoverflow.com/questions/22182050/sed-e-expression-1-char-23-unknown-option-to-s
        sed -i -e "s#${o1}#${n1}#g" $linDir
        sed -i -e "s#${o2}#${n2}#g" $linDir
        echo " "
        echo -e "${green}VSCodium's extension marketplace changed successfully.${nc}"
        echo " "
        exit 0
      else
        echo " "
        echo -e "${red}Insufficient privileges.${nc}"
        echo "Please run this script as root user."
        echo " "
        exit 1
      fi
      ;;
    -w|--windows)
      #I use the asterisk to avoid problems with the space in the "Program Files" folder.
      #https://askubuntu.com/questions/648577/copying-files-from-directories-having-spaces-in-its-name
      winDir="/mnt/c/Program*Files/VSCodium/resources/app/product.json"

      if [ -w $winDir ]
      then
        # using the '#' delimiter for sed since / causes problems with directories in windows.
        # https://stackoverflow.com/questions/22182050/sed-e-expression-1-char-23-unknown-option-to-s
        sed -i -e "s#${o1}#${n1}#g" $winDir
        sed -i -e "s#${o2}#${n2}#g" $winDir
        echo " "
        echo -e "${green}VSCodium's extension marketplace changed successfully.${nc}"
        echo " "
        exit 0
      else
        echo " "
        echo -e "${red}Insufficient privileges.${nc}"
        echo "Please run your WSL instance as an administrator."
        echo " "
        exit 1
      fi


      ;;
    *)
      echo "Unknown options given, use -h or --help for help."
      break
      ;;
  esac
done
