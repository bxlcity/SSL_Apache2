#!/bin/bash

# COLORS {{{
Bold=$(tput bold)
Underline=$(tput sgr 0 1)
Reset=$(tput sgr0)
# Regular Colors
Red=$(tput setaf 1)
Green=$(tput setaf 2)
Yellow=$(tput setaf 3)
Blue=$(tput setaf 4)
Purple=$(tput setaf 5)
Cyan=$(tput setaf 6)
White=$(tput setaf 7)
# Bold
BRed=${Bold}$(tput setaf 1)
BGreen=${Bold}$(tput setaf 2)
BYellow=${Bold}$(tput setaf 3)
BBlue=${Bold}$(tput setaf 4)
BPurple=${Bold}$(tput setaf 5)
BCyan=${Bold}$(tput setaf 6)
BWhite=${Bold}$(tput setaf 7)
#}}}

# =============================================================
# FUNCTIONS
# =============================================================

bak()
{
    FILE="/etc/apache2/sites-available/default-ssl.conf"
    if [ -f "$FILE" ] 
    then mv "$FILE" "$FILE.bak"
    fi
}

x_="______________________________________________________________________________"

print_line() {
  printf "%$(tput cols)s\n"|tr ' ' '*'
}

print_title() {
  clear
 print_line
  echo -e "# ${Bold}$1${Reset}"
  print_line
  echo ""
}

Install() {
  cd install/; python2 install.py
}

if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

print_title "${BGreen}SSL Certificate on Apache for Debian\n"

echo ""
echo "${BWhite} _/\/\____________________/\/\________________/\/\______/\/\_________________ "
echo " _/\/\________/\/\__/\/\__/\/\______/\/\/\/\__________/\/\/\/\/\__/\/\__/\/\_ "
echo " _/\/\/\/\______/\/\/\____/\/\____/\/\________/\/\______/\/\______/\/\__/\/\_ "
echo " _/\/\__/\/\____/\/\/\____/\/\____/\/\________/\/\______/\/\________/\/\/\/\_ "
echo " _/\/\/\/\____/\/\__/\/\__/\/\/\____/\/\/\/\__/\/\/\____/\/\/\__________/\/\_ "
echo " _________________________________________________________________/\/\/\/\___ "
echo ""
echo ${White}$x_
echo ""
echo "${BBlue}[+][INFO]:: Start Install SSL Certificate on Apache2 "
echo ""
sh -c "sudo apt-get update && apt-get install openssl && apt-get install apache2"
sh -c "sudo /etc/init.d/apache2 start"
sh -c "sudo a2enmod ssl"
sh -c "sudo a2ensite default-ssl"
sh -c "sudo /etc/init.d/apache2 reload"
sh -c "sudo mkdir /etc/apache2/ssl"
sh -c  "sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt"
sh -c "sudo chmod -R 777 /etc/apache2/ssl/*"
bak
sh -c "sudo cp default-ssl.conf /etc/apache2/sites-available/default-ssl.conf"
sh -c "sudo /etc/init.d/apache2 reload"
echo "${BWhite}[SSL Certificate Installed on debian ]::${Green} OK"
sh -c "sudo firefox https://127.0.0.1/"




