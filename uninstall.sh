#!/bin/bash

# Loop through all the dotfiles, if the file is a symlink then remove it
# Then if the backup file exists, restore it to it's original location
# Check to see if vim is installed and if so, ask if the user wished to un-install it.
# uninstall vim-scripts wile uninstalling vim (no point having the scripts without vim.

# https://www.shellhacks.com/yes-no-bash-script-prompt-confirmation/
# Billy Dickson 4/03/21

for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -h ~/$file ]; then
        rm -f ~/$file
    fi
    if [ -e ~/${file}.dtbak ]; then
        mv -f ~/$file{.dtbak,}
    fi
done


if dpkg -s net-tools >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall Net-Tools -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove net-tools;
            printf "Net-Tools uninstalled\n\n"; break;;
            [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
        esac
    done
fi


if dpkg -s curl >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall curl -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove curl;
            printf "Curl uninstalled\n\n"; break;;
            [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
        esac
    done
fi


if dpkg -s vim >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall vim -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove vim vim-scripts;
            printf "vim and vim-scripts uninstalled\n\n"; break;;
            [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
        esac
    done
fi


if dpkg -s tmux >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall tmux -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove tmux;
            printf "tmux uninstalled\n\n"; break;;
            [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
        esac
    done
fi


if dpkg -s neofetch >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall Neofetch -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove neofetch;
            printf "Neofetch Uninstalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi


if dpkg -s htop >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall htop -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove htop;
            printf "htop Uninstalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi

if dpkg -s whois >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall whois -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove whois;
            printf "htop Uninstalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi

if dpkg -s traceroute >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall traceroute -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove traceroute;
            printf "htop Uninstalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi

# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
if dpkg -s bat >/dev/null 2>&1; then
    while true; do
    read -p "Would you like to uninstall bat -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove bat;
            # Remove the cat alias from .bash_aliases
            sed -i '/batcat/d' .bash_aliases;
            printf "\n\n";
            printf "bat uninstalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi

printf "\nRemoving unused packages\n\n"
sudo apt autoremove

if dpkg -s cmatrix >/dev/null 2>&1; then
    while true; do
    read -p "Whould you like to uninstall cmatrix ascii screen saver -> " yn
        case $yn in
            [Yy]* ) sudo apt -y remove cmatrix;
            printf "cmatrix Unistalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi
            
