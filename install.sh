#!/bin/bash

# install python dependencies

# sudo apt-get install pipx
# pipx install reportlab==3.6.12
# pipx install pypdf2==3.0.1
pip install --break-system-packages reportlab==3.6.12 pypdf2==3.0.1

SCRIPTS_PATH=~/scripts
PROFILE_PATH=~/.profile
APP_INSTALL_PATH=~/.pdf2page
NEMO_SCRIPTS_PATH=~/.local/share/nemo/scripts
NAUTILUS_SCRIPTS_PATH=~/.local/share/nautilus/scripts

# install python app
if [ ! -d "$APP_INSTALL_PATH" ]; then
    mkdir $APP_INSTALL_PATH
fi

rm -r $APP_INSTALL_PATH/*
cp -R ./src/* $APP_INSTALL_PATH

# Install shell script
cp ./scripts/pdf2page.sh $SCRIPTS_PATH/pdf2page
# echo 'export PATH="$PATH:$HOME/scripts"' >> $PROFILE_PATH

# copy the content of ile-manager folder in ~/.local/share/nemo/scripts
if [ -d "$NEMO_SCRIPTS_PATH" ]; then
  cp -R ./file-manager/* ~/.local/share/nemo/scripts
fi

# copy the content of file-manager folder in ~/.local/share/nemnautilus/scripts
if [ -d "$NAUTILUS_SCRIPTS_PATH" ]; then
  cp -R ./file-manager/* ~/.local/share/nautilus/scripts
fi