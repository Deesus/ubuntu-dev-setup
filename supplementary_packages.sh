#!/bin/bash

# Some (opiniated) recommended packages for Debian/Ubuntu/Mint based distros.

# Add graphics drivers ppa:
sudo add-apt-repository ppa:graphics-drivers/ppa

# Update packages:
sudo apt-get update

# N.b. git is not preinstalled in some Debian/Ubuntu/Mint distros:
echo "\nInstalling Git..."
sudo apt install git -yq

# Install apt-get wrappers:
echo "\nInstalling package managers..."
sudo apt-get install aptitude -yq
sudo apt-get install synaptic -yq

# Install lvm2:
echo "\nInstalling lvm2..."
# N.b. this also resolves booting issues with Linux kernel 4.8.0-34-generic (earlier kernel releases don't seem to have this issue):
sudo apt-get install lvm2 -yq

# Install xinput:
echo "\nInstalling xinput..."
sudo apt-get install xinput -yq

# Install Chromium browser:
echo "\nInstalling Chromium..."
sudo apt-get install chromium-browser -yq

# Purge Flash plugin:
echo "\nPurging Flash plugin..."
sudo apt-get purge flashplugin-installer -y
sudo apt-mark hold flashplugin-installer
VARIANTS="iceape iceweasel mozilla firefox xulrunner midbrowser xulrunner-addons"
sudo update-rc.d -f flashplugin-installer remove >/dev/null 2>&1
sudo rm -rf /usr/lib/flashplugin-installer-unpackdir
sudo rm -rf /usr/lib/flashplugin-installer/*
sudo rm -f /var/lib/flashplugin-installer/*
sudo rm -rf /var/cache/flashplugin-installer-unpackdir
sudo rm -rf /var/cache/flashplugin-installer
sudo rm -f /usr/share/ubufox/plugins/libflashplayer.so
sudo rm -f /usr/share/ubufox/plugins/npwrapper.libflashplayer.so
for x in $VARIANTS; do
sudo update-alternatives --quiet --remove "$x-flashplugin" /usr/lib/flashplugin-installer/libflashplayer.so;
done
for x in $VARIANTS; do
sudo update-alternatives --quiet --remove "$x-flashplugin" /var/lib/flashplugin-installer/npwrapper.libflashplayer.so;
done

# Install gparted:
echo "/nInstalling gparted..."
sudo apt-get install gparted -yq

# Install VLC Player:
echo "/nInstalling VLC Player..."
sudo apt-get install vlc -yq

# Install qBittorrent:
echo "/nInstalling qBittorrent..."
sudo apt-get install qbittorrent -yq

# Install Nvidia drivers:
# n.b. the version of your package depends on your OS and card (don't use .run files)
# see https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia
echo "/nInstalling Nvidia 375 drivers."
echo "/nNote: The specific package you need will depend on your OS and your card."
sudo apt-get install nvidia-375 nvidia-settings

