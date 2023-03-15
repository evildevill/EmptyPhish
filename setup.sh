#!/bin/bash

# Check for internet connection

ping -c 1 google.com > /dev/null 2>&1 || { echo "Error: no internet connection found"; exit 1; }

echo "SETUP FOR EMPTYPHISH" | lolcat

OS=$(uname -o)

if [[ "$OS" == "Android" ]]; then
  pkg update -y
  pkg upgrade -y
  pkg install python2 -y
  pip2 install lolcat
  pkg install wget -y
  pkg install php -y
  pkg install curl -y
  pkg install openssh -y
  pkg install git -y
  git clone https://gitHub.com/evildevill/emptyphish.git
  cd emptyphish
  chmod +x *
  bash emptyphish.sh
else
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt-get install python2 -y
  sudo apt-get install python3 -y
  sudo apt-get install lolcat -y
  sudo apt-get install wget -y
  sudo apt-get install php -y
  sudo apt-get install curl -y
  sudo apt-get install openssh-server -y
  sudo apt-get install git -y