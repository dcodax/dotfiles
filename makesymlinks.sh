#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
# Thanks to: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="cmus gitconfig tmux tmux-powerlinerc tmux.conf vim vimrc zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/.dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s -v  $dir/$file ~/.$file
done
#problem creating symlinks where it does not correspond

function install_zsh {
# Test to see if zshell is installed. If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/michaeljsmalley/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh

# Download patched-fonts for terminal

#TODO: symlinks in all folders!! No please!!

function vundle-init () {
  if [ ! -d ~/.vim/bundle/vundle/ ]
  then
      mkdir -p ~/.vim/bundle/vundle/
  fi

  if [ ! -d ~/.vim/bundle/vundle/.git/ ]
  then
     git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
     echo "\n\tRead about vim configuration for vundle at https://github.com/gmarik/vundle\n"
  fi
}

function vundle () {
   vundle-init
   vim -c "execute \"BundleInstall\" | q | q"
}


function vundle-update () {
	vundle-init
	vim -c "execute \"BundleInstall!\" | q | q"
}

vundle

function tmux-powerline-init () {
  if [ ! -d ~/.tmux/tmux-powerline/ ]
  then
      mkdir -p ~/.tmux/tmux-powerline/
  fi

  if [ ! -d ~/.tmux/tmux-powerline/.git/ ]
  then
     git clone http://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline/
     echo "\n\tRead about tmux-powerline configuration for powerline at \n"
  fi
}

tmux-powerline-init

# Add virtualenv wrapper folder
mkdir -p $HOME/.virtualenvs
