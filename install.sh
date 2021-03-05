#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
# Check to see if vim is installed and if not, ask if the user wished to install it
# install vim-scripts while installing vim (value added).

# https://www.shellhacks.com/yes-no-bash-script-prompt-confirmation/
# Billy Dickson 4/03/21

for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
done

if hash vim 2>/dev/null; then
	printf "Vim installed\n"
else
    while true; do
    read -p "Would you like to install vim -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install vim vim-scripts; printf "vim and vim-scripts installed\n\n"; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

if hash tmux 2>/dev/null; then
    printf "Tmux installed\n"
else
    while true; do
    read -p "Would you like to install tmux -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install tmux; printf "Tmux installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi
