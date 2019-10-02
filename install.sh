#!/bin/bash

# Path to install everything

echo Install brew first
read -p "Press any key to continue… " -n1 -s
echo '\n'

if ! which brew > /dev/null; 
then
     # Install Homebrew 
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else echo 'brew is already installed'
fi;

# Update any existing homebrew recipes
brew update
# Upgrade any already installed formulae
brew upgrade --all
# Disable analytics from being send
brew analytics off

# create a Brewfile
touch Brewfile

# add the formulas I can't live without
echo 'install git' >> Brewfile
echo 'install vim --override-system-vi' >> Brewfile
echo 'install git' >> Brewfile
echo 'install wget' >> Brewfile
echo 'install curl' >> Brewfile
echo 'install unrar' >> Brewfile
echo 'install speedtestCli' >> Brewfile

# tap into repositories
echo 'tap phinze/homebrew-cask' >> Brewfile

# `bundle` simply prefixes every line in the Brewfile with "brew"
echo 'cask install 1password' >> Brewfile 
echo 'cask install alfred' >> Brewfile 
echo 'cask install caffeine' >> Brewfile 
echo 'cask install coconutbattery' >> Brewfile 
echo 'cask install flux' >> Brewfile 
echo 'cask install little-snitch' >> Brewfile 
echo 'cask install the-unarchiver' >> Brewfile 
echo 'cask install firefox' >> Brewfile
echo 'cask install google-chrome' >> Brewfile

echo 'doctor' >> Brewfile # runs `brew doctor`

# Process the brew filt to a specific location
brew bundle ~/User/sjoerdboonstra/Applications

# this will process the Brewfile in the current directory
# brew bundle

# Remove brew cruft
brew cleanup
# Remove cask cruft
brew cask cleanup