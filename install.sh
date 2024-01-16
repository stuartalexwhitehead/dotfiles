#!/bin/bash

# Import helper scripts
source "scripts/helpers/functions.sh"

# Check base dependencies
echo -ne "Checking for Homebrew… "
if exists "brew"; then
 echo "installed"
else
  echo "installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo -ne "Checking for zsh… "
if exists "zsh"; then
 echo "installed"
else
  echo "installing" 
  brew install zsh
  ln -sf $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
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

echo -ne "Checking for nvim… "
if exists "nvim"; then
 echo "installed"
else
  echo "installing"
  brew install nvim
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo -ne "Checking for pyenv… "
if exists "pyenv"; then
 echo "installed"
else
  echo "installing"
  brew install pyenv pyenv-virtualenv
fi

echo -ne "Checking for just…"
if exists "just"; then
 echo "installed"
else
  echo "installing"
  brew install just
fi

# Link things up
echo "Linking things up"
ln -sf $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -sf $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $HOME/.dotfiles/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
