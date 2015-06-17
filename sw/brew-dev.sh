#!/bin/bash

echo "Installing my personal developement envs..."
  brew install openssl
  brew install memcached
  brew install mycrypt
  brew tap homebrew/dupes
  brew tap homebrew/versions
  brew tap homebrew/homebrew-php
  brew install php56
  brew install php56-mcrypt
  brew install php56-memcached
  brew install phpmyadmin
  brew install composer
  brew install mysql
  # brew cask install virtualbox
  brew cask install node

  echo "Installing essential Node packages..."
    npm install -g gulp grunt yo bower
