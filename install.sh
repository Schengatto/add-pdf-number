#!/bin/bash

# sudo apt-get install pipx
# pipx install reportlab==3.6.12
# pipx install pypdf2==3.0.1

# install python dependencies
OPERATIVE_SYSTEM=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if [ ! -z $OPERATIVE_SYSTEM ] && [ $OPERATIVE_SYSTEM=="Ubuntu" ]; then
  pip install --break-system-packages reportlab==3.6.12 pypdf2==3.0.1
else
  pip install reportlab==3.6.12 pypdf2==3.0.1
fi

# Variables
SCRIPTS_PATH=~/scripts
PROFILE_PATH=~/.profile
APP_INSTALL_PATH=~/.pdf2page
NEMO_SCRIPTS_PATH=~/.local/share/nemo/scripts
NAUTILUS_SCRIPTS_PATH=~/.local/share/nautilus/scripts

red='\e[0;31m'
yellow='\e[0;33m'
cyan='\e[0;36m'
white='\e[0;37m'

# fix executable files
chmod +x ./scripts/pdf2page.sh
chmod +x ./file-manager/pdf2page
chmod +x ./src/uninstall.sh

# install python app
if [ ! -d "$APP_INSTALL_PATH" ]; then
    mkdir $APP_INSTALL_PATH
fi

rm -rf $APP_INSTALL_PATH/*
cp -R ./src/* $APP_INSTALL_PATH

# Install shell script
cp ./scripts/pdf2page.sh $SCRIPTS_PATH/pdf2page
echo 'export PATH="$PATH:$HOME/scripts"' >> $PROFILE_PATH

# copy the content of ile-manager folder in ~/.local/share/nemo/scripts
if [ -d "$NEMO_SCRIPTS_PATH" ]; then
  cp -R ./file-manager/* ~/.local/share/nemo/scripts
fi

# copy the content of file-manager folder in ~/.local/share/nemnautilus/scripts
if [ -d "$NAUTILUS_SCRIPTS_PATH" ]; then
  cp -R ./file-manager/* ~/.local/share/nautilus/scripts
fi

echo "Installation completed, restart the user session to apply the changes."