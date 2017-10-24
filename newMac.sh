#!/bin/bash


#make sure any submodules are checked out
if [ `git remote -v|grep origin|grep fetch` = *timofei7/dots.git* ]; then
	git submodule init; git submodule update
fi


#install homebrew:
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)


brew install autojump thefuck mobile-shell wget python ruby git zsh zsh-completions zsh-lovers gawk gnu-sed htop-osx iftop sl vim

brew tap caskroom/versions

brew cask install atom-beta

# copy before running macos setup
cp -f ${HOME}/dotfiles/init/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

chmod a+x ./macos
./macos

# run dotsetup symlinking
chmod a+x ./dotSetup.#!/bin/sh
./dotSetup.sh ${HOME}/dotfiles


echo remember to also:
echo    install iterm2, app store stuff, etc
