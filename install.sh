#!/bin/bash

# Install packages

if zenity --question --text="Install i3wm?"
then 
    PASSWD="$(zenity --password --title=Authentication)\n"
    echo -e $PASSWD | sudo -S pacman -Sy i3-gaps
    notify-send "installed i3wm"

    if zenity --question --text="Install Tint2 Panel?"
    then 
        PASSWD="$(zenity --password --title=Authentication)\n"
        echo -e $PASSWD | sudo -S pacman -Sy tint2
        notify-send "installed Tint2"
    else
        notify-send "skipping Tint2 installation!"
    fi

else
    notify-send "skipping i3wm installation!"
fi

if zenity --question --text="Want to copy the configurations?"
then 
    echo "changing directory"
    cd ../
    sudo -S cp -r Peux-i3/*/ $HOME/.config/
    notify-send "Copied the configurations"
else
    notify-send "skipping the setup!"
fi

rm -rf /tmp/fetcher/Peux-i3
notify-send "Done!"