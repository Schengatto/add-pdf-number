#!/bin/bash
APP_INSTALL_PATH=~/.pdf2page

red='\e[0;31m'

if [[ -z "$1" ]]; then
   echo -e "${red}ERROR: You must provide the name of the PDF file as second argument. Example: pdf2page ~/document/my_pdf.pdf"
   exit 1
fi

python3 ${APP_INSTALL_PATH}/add-page-number.py $1