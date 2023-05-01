#!/bin/bash

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
green='\e[0;32m'

rm -f $SCRIPTS_PATH/pdf2page.sh

# copy the content of ile-manager folder in ~/.local/share/nemo/scripts
if [ -d "$NEMO_SCRIPTS_PATH" ]; then
  rm -R ~/.local/share/nemo/scripts/pdf2page
fi

# copy the content of file-manager folder in ~/.local/share/nemnautilus/scripts
if [ -d "$NAUTILUS_SCRIPTS_PATH" ]; then
  rm -R ~/.local/share/nautilus/scripts/pdf2page
fi

rm -rf $APP_INSTALL_PATH/*

rm -d $APP_INSTALL_PATH

if [ ! -d $APP_INSTALL_PATH ] && [ ! -f "$SCRIPTS_PATH/pdf2page.sh" ]; then
    echo -e "${green}Pdf2Page removed successfully"
else
    echo -e "${red}ERROR: Something went wrong, follow the manual process inside the readme.md file"
fi
