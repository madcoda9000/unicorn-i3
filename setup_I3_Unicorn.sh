#!/bin/Bash

# START functions block

# function to copy i3 config from .config to users home
function copyI3Config () {
    cp -r '.config/i3' '/home/$user/.config/'
    chmod +x '/home/$USER/.config/i3/*.sh'
}

# function to copy i3blocks from .config to users home
function copyI3BlocksConfig () {
    cp -r '.config/i3blocks' '/home/$USER/.config/'
    chmod +x '/home/$USER/.config/i3blocks/scripts/*'
}

# function to copy i3status from .config to users home
function copyI3StatusConfig () {
    cp -r '.config/i3status' '/home/$USER/.config/'
}

# function to copy rofi config from .config to users home
function copyRofiConfig () {
    cp -r '.config/rofi' '/home/$USER/.config/'
}

# END functions Block

# install i3 dependencies
sudo git apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev i3 i3lock dmenu feh fonts-font-awesome picom fonts-droid-fallback i3blocks rofi maim xclip copyq xdotool xautolock -y

# copy i3 config and scripts
if [ -d "/home/$USER/.config/i3" ]; then
    while true; do
        read -p "i3 config exists already! Do you wish to backup your config and install the new one? " yn
        case $yn in
            [Yy]* ) mv '/home/$USER/.config/i3' '/home/$USER/.config/i3_old' && copyI3Config; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    copyI3Config
fi


# copy i3blocks config and scripts
if [ -d "/home/$USER/.config/i3blocks" ]; then
    while true; do
        read -p "i3blocks config exists already! Do you wish to backup your config and install the new one? " yn
        case $yn in
            [Yy]* ) mv '/home/$USER/.config/i3blocks' '/home/$USER/.config/i3blocks_old' && copyI3BlocksConfig; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    copyI3BlocksConfig
fi

# copy rofi config
if [ -d "/home/$USER/.config/rofi" ]; then
    while true; do
        read -p "rofi config exists already! Do you wish to backup your config and install the new one? " yn
        case $yn in
            [Yy]* ) mv '/home/$USER/.config/rofi' '/home/$USER/.config/rofi_old' && copyRofiConfig; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    copyRofiConfig
fi

# copy i3status config
if [ -d "/home/$USER/.config/i2status" ]; then
    while true; do
        read -p "i3status config exists already! Do you wish to backup your config and install the new one? " yn
        case $yn in
            [Yy]* ) mv '/home/$USER/.config/i3status' '/home/$USER/.config/i3status_old' && copyI3StatusConfig; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    copyI3StatusConfig
fi


# install i3lock-colors
cd /tmp
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
chmod +x install-i3lock-color.sh
./install-i3lock-color.sh
