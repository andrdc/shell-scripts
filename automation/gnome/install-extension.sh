#! /bin/bash

# install-extension - Install gnome shell extensions from .zip file

# Where the file are located
user=$(whoami)
downloadDir="/home/$user/Downloads"
shellExtensionDir="/home/$user/.local/share/gnome-shell/extensions/"

# Get shell extention's name
cd $downloadDir
shellExtensionName=$(unzip -c $1 metadata.json | grep uuid | cut -d \" -f4)
# Make shell extention's directory
$(mkdir -p "$shellExtenstionDir$shellExtensionName")
# Unzip the file to the directory
$(unzip -q $1 -d "$shellExtensionDir$shellExtensionName/")
# Enable extension
$(gnome-extensions enable $shellExtensionName)
