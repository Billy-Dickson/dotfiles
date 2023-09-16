## Preamble

I've recently installed  [Pop! OS](https://pop.system76.com) on my new laptops and I've been slowly re-learning [bash scripting](https://ryanstutorials.net/bash-scripting-tutorial/). I started programming at school about 35 years ago and later, while I was at University.

This is fork of a mature project that extends the bash setup on my Laptops and any other computer I care to install it on, I'll be adding functionality when time permits. At the moment, I'm quite enjoying the whole process, as it help me re-learn languages and techniques that I once used on a daily basis, the ones that I no longer use in my current job.

It scratches an itch. :smile:

[![License: CC0-1.0](https://img.shields.io/badge/License-CC0%201.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)

## Table of Contents
 - [Installation](#installation)
   - [Download and change folder](#download-and-change-folder)
   - [Run installer](#run-installer)
 - [Removal](#removal)
   - [Change to dotfiles folder](#change-to-dotfiles-folder)
   - [Run uninstaller](#run-uninstaller)
 - [References and helpfull links](#references-and-helpfull-links)

![Terminal Screenshot](assets/Screenshot.png)

## Installation

You will need to install git first before downloading the dotfiles, to install git, type the following at the prompt.

```shell scripting
sudo apt install git sudo
```

If your installing on a virgin install of debian, you'll have to setup sudo. To do this you will have to edit a file /etc/sudoes and add your username after the root username.

```shell scripting
su
nano /etc/sudoers
```

User privilege specification

root    ALL=(ALL:ALL) ALL

username  ALL=(ALL)  ALL

### Download and change folder
```shell scripting
cd ~
git clone https://github.com/Billy-Dickson/dotfiles.git
cd dotfiles
```
### Run installer
```shell scripting
./install.sh
```
## Removal

### Change to dotfiles folder
```shell scripting
cd ~/dotfiles
```

### Run uninstaller
```shell scripting
./uninstall.sh
```

## References and helpfull links
[Tmux Cheat Sheet](https://tmuxcheatsheet.com/)  
[Vim Cheat Sheet](https://devhints.io/vim)  
[Bash scripting Cheat sheet](https://devhints.io/bash)  
[Bash handbook](https://github.com/denysdovhan/bash-handbook)  
[Emoji Cheat sheet](https://github.com/ikatyang/emoji-cheat-sheet#table-of-contents)  
[A list of tmux plugins.](https://github.com/tmux-plugins/list)  
[A list of programming languages known to github](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)   
