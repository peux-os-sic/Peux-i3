#!/bin/bash


##################################################
## Author - DN-debug
## Description - Peux i3WM setup via fetcher app
##################################################

# Install packages

if zenity --question --text="Install i3wm?"
then 

    PASSWD="$(zenity --password --title=Authentication)\n"

    pkg="$(pacman -Qq | grep i3-gaps)"
    
    if [ "${pkg}" = "i3-gaps" ]; then
        notify-send "i3wm is already installed. Skipping!"   
    else 
        echo -e $PASSWD | sudo -S pacman -Syu i3-gaps
        notify-send "installed i3wm"
    fi
    if zenity --question --text="Install Tint2 Panel?"
    then 
        pkg1="$(pacman -Qq | grep tint2)"
        if [ "${pkg1}" = "tint2" ]; then
            notify-send "Tint2 is already installed. Skipping!"
        else
            echo -e $PASSWD | sudo -S pacman -Syu tint2
            notify-send "installed Tint2"
        fi
    fi
    if zenity --question --text="Install Rofi?"
    then 
        pkg1="$(pacman -Qq | grep rofi | tail -n1)"
        if [ "${pkg1}" = "rofi" ]; then
            notify-send "Rofi is already installed. Skipping!"
        else
            echo -e $PASSWD | sudo -S pacman -Syu rofi
            notify-send "installed Rofi"
        fi
    fi

else
    notify-send "skipping i3wm installation!"
fi

# copy configurations

if zenity --question --text="Want to copy the configurations?"
then 
    echo "changing directory"
    cd ../
    sudo -S cp -r Peux-i3/*/ $HOME/.config/
    notify-send "Copied the configurations"
else
    notify-send "skipping the setup!"
fi

# cleanup

rm -rf /tmp/fetcher/Peux-i3
notify-send "Done!"