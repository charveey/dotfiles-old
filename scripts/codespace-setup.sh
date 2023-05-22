#!/bin/bash


#List of packages needed
packagesNeeded='curl git sudo nano wget npm ruby'
packagesArch='chezmoi'

#Check what package manager is installed, update and install required packages
if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install -y $packagesNeeded && sudo apt-get autoremove -y && sudo rm -rf /var/lib/apt/lists/*
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
elif [ -x "$(command -v pacman)" ];     then sudo pacman -Syu --noconfirm $packagesNeeded $packagesArch
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi
