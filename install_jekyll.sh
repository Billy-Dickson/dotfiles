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

if dpkg -s zlib1g-dev >/dev/null 2>&1 && dpkg -s ruby-full >/dev/null 2>&1 \
    && dpkg -s  build-essential >/dev/null 2>&1 && gem spec bundler >/dev/null 2>&1 \
    && gem spec jekyll >/dev/null 2>&1;
then
    printf "Jekyll installed\n"
else
    while true; do
	     read -p "Would you like to install Jekyll -> " yn
	      case $yn in
           [Yy]* ) sudo apt -y install ruby-full build-essential zlib1g-dev; \
           printf "\nRuby, build essential and zliblg-dev Installed\n\n" \
	         gem install jekyll bundler; \
           printf "\nGems jekyll and bundler Installed\n\n"; break;;
           [Nn]* ) exit;;
          * ) echo "Please answer yes or no.";;
        esac
    done
fi
