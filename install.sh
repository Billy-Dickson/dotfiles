#!/bin/bash

# Find all dot files then, if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
# Check to see if vim is installed and if not, ask if the user wished to install it
# install vim-scripts while installing vim (value added).

# Billy Dickson 4/03/21
# https://www.shellhacks.com/yes-no-bash-script-prompt-confirmation/
#
# Billy Dickson 08/03/21
# Test to see if the symbolic link to .bashrc is there, if it is, then the
# install program has already been run, suggest running uninstall.sh first
# then quit.
#

if [ -L $HOME'/.bashrc' ]; then
    printf "\nThe dotfiles have already been installed. Try running uninstall program first.\n\n"
    printf "./uninstall.sh\n\n"
else
  for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
      mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
  done
fi

printf "\nUpdating package repository\n\n"
sudo apt update
printf "\nUpgrading packages\n\n"
sudo apt upgrade

# Changed to use dkpg instead of "hash <package_name> 2>/dev/null; then""
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
if dpkg -s vim >/dev/null 2>&1; then
	printf "\nVim installed\n"
else
    while true; do
    read -p "Would you like to install Vim -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install vim vim-scripts;
            printf "vim and vim-scripts installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

# Changed to use dkpg instead of "hash <package_name> 2>/dev/null; then""
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
if dpkg -s tmux >/dev/null 2>&1; then
    printf "Tmux installed\n"
else
    while true; do
    read -p "Would you like to install tmux -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install tmux;
            printf "Tmux installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# Changed to use dkpg instead of "hash <package_name> 2>/dev/null; then""
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
if dpkg -s neofetch >/dev/null 2>&1; then
  printf "Neofetch installed\n"
else
    while true; do
      read -p "Would you like to install Neofetch -> " yn
      case $yn in
          [Yy]* ) sudo apt -y install neofetch;
          printf "Neofetch installed\n\n"; break;;
          [Nn]* ) exit;;
          * ) echo "Please answer yes or no.";;
      esac
    done
fi

# Changed to use dkpg instead of "hash <package_name> 2>/dev/null; then""
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
if dpkg -s htop >/dev/null 2>&1; then
	printf "htop installed\n"
else
    while true; do
    read -p "Would you like to install htop -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install htop;
            printf "htop installedn\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

# Changed to use dkpg instead of "hash <package_name> 2>/dev/null; then""
# this ensures that it gives a more consise and reliable yes/no 0/1 answer.
if dpkg -s whois >/dev/null 2>&1; then
	printf "whois installed\n"
else
    while true; do
    read -p "Would you like to install whois -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install whois;
            printf "whois installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

# Check to see if a ruby gem is installed, if not then install.
# https://serverfault.com/questions/391621/checking-if-a-ruby-gem-is-installed-from-bash-script
#
# I'm going to spin this out to a seperate file to install on this repository.
#
# Billy Dickson 19/04/22
#
# Optionally install Jekyll if its missing
#
# Check to see if the applications have been installed and also check
# to see if the gem files have been installed, if they aren't then ask the
# user If they would like to install the applications and the gems for
# running jekyll
#
#if dpkg-query -s zlib1g-dev 1>/dev/null && dpkg-query -s ruby-full 1>/dev/null \
#  && dpkg-query -s  build-essential 1>/dev/null && gem spec bundler 1>/dev/null 2>&1 \
#  && gem spec jekyll 1>/dev/null 2>&1;
#then
#  printf "Jekyll installed\n"
#else
#     while true; do
#	      read -p "Would you like to install Jekyll -> " yn
#	      case $yn in
#           [Yy]* ) sudo apt -y install ruby-full build-essential zlib1g-dev; \
#           printf "\nRuby, build essential and zliblg-dev Installed\n\n" \
#	         gem install jekyll bundler; \
#           printf "\nGems jekyll and bundler Installed\n\n"; break;;
#           [Nn]* ) exit;;
#          * ) echo "Please answer yes or no.";;
#        esac
#      done
#  fi
