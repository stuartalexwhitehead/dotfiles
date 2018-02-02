#!/bin/bash

# Import helper scripts
source "scripts/helpers/functions.sh"

# Check base dependencies
echo -ne "Checking for Homebrew… "
if exists "brew"; then
 echo "installed"
else
  echo "installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -ne "Checking for zsh… "
if exists "zsh"; then
 echo "installed"
else
  echo "installing" 
  brew install zsh
  ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc
fi

echo -ne "Checking for Oh My Zsh… "
if [ -d $HOME/.oh-my-zsh/ ]; then
 echo "installed"
else
  echo "installing"
  if exists "curl"; then
    curl -L http://install.ohmyz.sh | sh
  else
    echo "curl is needed to install Oh My Zsh"
  fi
fi

echo -ne "Checking for system Node.js… "
if exists "npm"; then
 echo "installed"
else
  echo "installing"
  brew install node
fi


echo -ne "Checking for yarn… "
if exists "yarn"; then
 echo "installed"
else
  echo "installing"
  brew install yarn
fi

# Link things up
echo "Linking things up"
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
