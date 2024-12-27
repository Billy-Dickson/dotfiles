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