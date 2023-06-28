#!/bin/bash

echo "Enter your password: "
read -s password

# Update the system
echo $password | sudo -S apt-get update
echo $password | sudo -S apt-get upgrade -y

# Install the software

# JetBrains Toolbox
echo $password | sudo -S snap install jetbrains-toolbox --classic

# Discord
echo $password | sudo -S snap install discord

# GIMP
echo $password | sudo -S apt-get install -y gimp

# Steam
echo $password | sudo -S apt-get install -y steam

# VLC
echo $password | sudo -S apt-get install -y vlc

# Oracle VirtualBox
echo $password | sudo -S apt-get install -y virtualbox

# Brave browser
echo $password | sudo -S apt-get install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/sources.list.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
echo $password | sudo -S apt-get update
echo $password | sudo -S apt-get install -y brave-browser

# Git
echo $password | sudo -S apt-get install -y git

# Python
echo $password | sudo -S apt-get install -y python3

# GCC
echo $password | sudo -S apt-get install -y gcc

# Bitwarden
echo $password | sudo -S snap install bitwarden

# Microsoft Teams
echo $password | sudo -S apt-get install -y teams

# Kate
echo $password | sudo -S apt-get install -y kate

# Terminator
echo $password | sudo -S apt-get install -y terminator

# Set the default terminal emulator to Terminator
echo $password | sudo -S update-alternatives --set x-terminal-emulator /usr/bin/terminator

# Set the default browser to Brave
echo $password | sudo -S update-alternatives --set x-www-browser /usr/bin/brave-browser

# Clear the password variable
unset password
