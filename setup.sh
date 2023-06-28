#!/bin/bash

echo "Enter your password: "
read -s password

# Update the system
echo $password | sudo -S apt-get update
echo $password | sudo -S apt-get upgrade -y

# List of software
software_list=("JetBrains_Toolbox" "Discord" "GIMP" "Steam" "VLC" "Oracle_VirtualBox" "Brave_Browser" "Git" "Python" "GCC" "Bitwarden" "Microsoft_Teams" "Kate" "Terminator")

# Create a checklist dialog
selected_software=$(zenity --list --checklist --title="Select software to install" --column="Select" --column="Software" "${software_list[@]/#/FALSE }")

# Loop through the list and install selected software
for software in ${selected_software[@]}; do
    case $software in
        "JetBrains_Toolbox")
            echo $password | sudo -S snap install jetbrains-toolbox --classic
            ;;
        "Discord")
            echo $password | sudo -S snap install discord
            ;;
        "GIMP")
            echo $password | sudo -S apt-get install -y gimp
            ;;
        "Steam")
            echo $password | sudo -S apt-get install -y steam
            ;;
        "VLC")
            echo $password | sudo -S apt-get install -y vlc
            ;;
        "Oracle_VirtualBox")
            echo $password | sudo -S apt-get install -y virtualbox
            ;;
        "Brave_Browser")
            echo $password | sudo -S apt-get install apt-transport-https curl
            curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/sources.list.d/brave-browser-release.gpg add -
            echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
            echo $password | sudo -S apt-get update
            echo $password | sudo -S apt-get install -y brave-browser
            ;;
        "Git")
            echo $password | sudo -S apt-get install -y git
            ;;
        "Python")
            echo $password | sudo -S apt-get install -y python3
            ;;
        "GCC")
            echo $password | sudo -S apt-get install -y gcc
            ;;
        "Bitwarden")
            echo $password | sudo -S snap install bitwarden
            ;;
        "Microsoft_Teams")
            echo $password | sudo -S apt-get install -y teams
            ;;
        "Kate")
            echo $password | sudo -S apt-get install -y kate
            ;;
        "Terminator")
            echo $password | sudo -S apt-get install -y terminator
            ;;
    esac
done

# Clear the password variable
unset password
