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

# changed to use dkpg instead of hash <package_name> 2>/dev/null; Then
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
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

# changed to use dkpg instead of hash <package_name> 2>/dev/null; Then
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
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

# changed to use dkpg instead of hash <package_name> 2>/dev/null; Then
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
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

# changed to use dkpg instead of hash <package_name> 2>/dev/null; Then
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
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

# changed to use dkpg instead of hash <package_name> 2>/dev/null; Then
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
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

# changed to use dkpg instead of hash <package_name> 2>/dev/null; Then
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
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
            printf "bat Uninstalled\n\n"; break;;
            [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
        esac
    done
fi

printf "\nRemoving unused packages\n\n"
sudo apt autoremove

# Removing at the moment, I'll spin this off to a seperate uninstall file for
# Jekyll and Gems
#
# Optionally uninstall Jekyll and Gems
#
# Check to see if ruby-full is installed, if it is give the option to removed
# ruby and all the gems associated with Jekyll and Gems.
#if hash ruby-full 2>/dev/null; then
#  printf "Ruby-Full installed and Jekyll"
#     while true; do
#	      read -p "Would you like to un-install Jekyll, Ruby-> and the gems" yn
#	      case $yn in
#          [Yy]* ) gem uninstall jekyll bundler; \
#           sudo apt -y remove ruby-full build-essential zlib1g-dev; \
#           printf "\nRuby, build essential and zliblg-dev removed\n\n"
#           printf "\nGems jekyll and bundler Installed\n\n"; break;;
#           [Nn]* ) exit;;
#          * ) echo "Please answer yes or no.";;
#        esac
#      done
#fi
