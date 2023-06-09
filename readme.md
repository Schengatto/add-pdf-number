# Linux add page numbers to pdf files

This is a script for Linux that allows you to easily add the page numbers into a pdf file.
If you have Nemo or Nautilus as file manager you will also find this script as a shortcut in the context menu under the voice "Script".

## Requirements

In order to execute this script you must ensure to have Python 3 installed in your system.

> sudo apt-get install python3

You also need `pip` to be installed

> sudo apt-get install pip

## How to install

1. Download the zip file of this project using the green button "CODE".

2. Extract the content of the zip file.

3. Open a shell terminal and move to folder where the content of the zip file was extracted.

4. Make sure that the file `./install.sh` is executable. You can run the command `chmod +x install.sh` to make it executable.

5. Execute the command `/bin/bash ./install.sh`.

6. In order to have the script "pdf2page" available everywhere in your terminal you will need to reload the user session.

## How to uninstall (Manually)

1. Remove the file `~/scripts/pdf2page` inside your home folder.

2. Open the file `~/.profile` and delete the `row export PATH="$PATH:$HOME/scripts"`.

3. Remove the file `pdf2page` inside the folder `~/.local/share/nemo/scripts`.

4. Remove the folder `~/.pdf2page`.

## How to uninstall (Automatically)

1. Open a terminal

2. Execture the command `/bin/bash ~/.pdf2page/uninstall.sh`
