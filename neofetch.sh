# https://stackoverflow.com/questions/1298066/how-can-i-check-if-a-package-is-installed-and-install-it-if-not
# Handy bash script to check if a package is installed, to be used to check before installing the applications.
# Billy Dickson 20/04/22

if dpkg -s neofetch >/dev/null 2>&1; then
    printf "\nNeofetch Installed\n\n"
else
    printf "\nNeofetch Not Installed\n\n"
fi
