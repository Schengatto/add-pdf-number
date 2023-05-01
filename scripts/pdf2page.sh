#!/bin/bash
APP_INSTALL_PATH=~/.pdf2page

red='\e[0;31m'
yellow='\e[0;33m'

if [[ -z "$1" ]]; then
   echo -e "${red}ERROR: You must provide the name of the PDF file as second argument. Example: pdf2page ~/document/my_pdf.pdf"
   exit 1
fi

read -p "Position of page numbers (empty: center)? [left,right,center]: " position

read -p "Font size (empty: 12)?: " font_size

python3 ${APP_INSTALL_PATH}/add-page-number.py $1 $position $font_size