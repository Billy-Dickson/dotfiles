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