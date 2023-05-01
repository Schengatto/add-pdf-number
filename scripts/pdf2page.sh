#!/bin/bash
APP_INSTALL_PATH=~/.pdf2page

red='\e[0;31m'
yellow='\e[0;33m'
cyan='\e[0;36m'
white='\e[0;37m'

if [[ -z "$1" ]]; then
   echo -e "${red}ERROR: You must provide the name of the PDF file as second argument. Example: pdf2page ~/document/my_pdf.pdf"
   read wait
   exit 1
fi

FILE_TYPE=$(head -c 4 "$1")
if [[ -z $FILE_TYPE ]]; then 
   echo -e "${red}ERROR: The selected file '${1}' is not a valid pdf."
   read wait
   exit 1
fi

if [[ ! $FILE_TYPE = "%PDF" ]]; then
   echo -e "${red}ERROR: The selected fisle is not a pdf. ${1}"
   read wait
   exit 1
fi

echo -e "${cyan}Position of page numbers?\nL) left\nR) right\nC) center (default)${white}"
read -p "> " position

echo -e "${cyan}Font size (default: 12)?${white}"
read -p "> " font_size

python3 ${APP_INSTALL_PATH}/add-page-number.py $1 $position $font_size