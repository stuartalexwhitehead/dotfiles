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
fi
