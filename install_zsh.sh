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