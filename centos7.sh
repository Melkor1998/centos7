#!/bin/bash

function setup {
clear
echo 'Do you want to install vscode as well?
1. Yes
0. No'
read -s -n1 code; clear
sudo yum install epel-release -y
if [[ $code == '1' ]]; then
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	yum check-update
	sudo yum install code -y
elif [[ $code == '0' ]]; then
	echo ''
else
	clear && exit
fi
ls google-chrome-stable_current_x86_64.rpm 2> /dev/null || wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo yum localinstall google-chrome-stable_current_x86_64.rpm -y
sudo yum upgrade google-chrome-stable -y
sudo yum install vim -y
echo 'syntax on
set nu
set tabstop=4' > ~/.vimrc
sudo yum install net-tools -y
sudo yum groupinstall "X Window system" "Xfce" -y
}
setup || echo -e "\e[91;1;5mError\e[0m" && clear && echo -e "\e[92;1mEnjoy your work\nScript was made by Shota from ITVET group 67\nSetup will finnish in 5 seconds\e[0m" && sleep 5 && sudo systemctl isolate graphical.target && sudo systemctl set-default graphical.target
