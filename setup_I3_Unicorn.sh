#!/bin/Bash

# install i3 dependencies
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev i3 i3lock dmenu feh fonts-font-awesome picom fonts-droid-fallback i3blocks rofi maim xclip copyq xdotool xautolock -y

# copy i3 config and scripts

# copy i3blocks config and scripts

# copy i3statuus config

# install i3lock-colors
cd $USER/Downloads
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh

# copy i3lock config

# copy rofi themes
