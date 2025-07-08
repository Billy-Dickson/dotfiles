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

# Ask then if yes install net-tools
if dpkg -s net-tools >/dev/null 2>&1; then
	printf "\nNet-Tools installed\n"
else
    while true; do
    read -p "Would you like to install Net-Tools -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install net-tools;
            printf "Net-Tools installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

# Ask then if yes install curl.
if dpkg -s curl >/dev/null 2>&1; then
	printf "Curl installed\n"
else
    while true; do
    read -p "Would you like to install curl ->" yn
        case $yn in
            [Yy]* ) sudo apt -y install curl;
            printf "Curl installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

# Ask then if yes install vim and vim scripts
if dpkg -s vim >/dev/null 2>&1; then
	printf "Vim installed\n"
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

# Ask then if yes install tmux
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

# Ask then if yes install neofetch
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

# Ask then if yes install htop
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

# Ask then if yes install whois
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

if dpkg -s traceroute >/dev/null 2>&1; then
        printf "traceroute installed\n"
else
    while true; do
    read -p "Would you like to install traceroute -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install traceroute;
            printf "traceroute installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi


# Ask then if yes install bat, need to add a check for the arm (rasperry pi platform) before trying
# to install as that package isn't in the repository.

# I need to add a check as bat doesn't seem to be available for arm at the moment.

if dpkg -s bat >/dev/null 2>&1; then
	printf "\nbat installed\n\n"
else
    while true; do
    read -p "Would you like to install bat, an colourful alternative to cat -> " yn
            case $yn in
            [Yy]* ) sudo apt -y install bat;
            # add the cat alias to .bash_aliases
            echo "alias cat='/usr/bin/batcat'" >> .bash_aliases;
            printf "\nbat installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

if dpkg -s cmatrix >/dev/null 2>&1; then
    printf "cmatrix terminal screen saver installed\n"
else   
    while true; do
    read -p "Would you like to install cmatrix terminal screen saver -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install cmatrix;
            printf "cmatrix installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# From Tom Lawrence's repo
# Install  vim-addons ZSH and ZSH extras

if which zsh > /dev/null 2>&1; then
    printf "The ZSH shell is already installed\n"
else 
while true; do
    read -p "Would you like to install ZSH and Extras -> " yn
        case $yn in
            [Yy]* ) sudo apt -y install vim-scripts zsh zsh-syntax-highlighting zsh-autosuggestions;
            printf "ZSH and Extras installed\n\n"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
       esac
    done
fi

echo
echo "use chsh -s /bin/zsh to switch to ZSH shell"
