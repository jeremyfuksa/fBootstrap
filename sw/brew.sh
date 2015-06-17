#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

################################################################[ BREW ]########
brew_path=`which brew`
if [[ ! -f $brew_path ]]
then
  echo "Installing Homebrew, a good OS X package manager..."
    successfully ruby <(curl -fsS https://raw.github.com/mxcl/homebrew/go)
fi

echo "Putting Homebrew location earlier in PATH ..." # similar to https://github.com/thoughtbot/laptop/blob/master/mac)
  successfully echo "export PATH='/usr/local/bin:\$PATH'" >> ~/.zshrc
  export PATH=/usr/local/bin:$PATH #temporary on bash

echo "Upgrading Homebrew..."
  successfully brew update
  successfully brew upgrade

################################################################[ SW inst ]#####
echo "Hipsterizing your terminal with homebrewed zsh + Oh my zsh!"
  successfully brew install zsh
  successfully curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing homebrew-cask... (easy .app install automation)"
  successfully brew tap phinze/homebrew-cask
  successfully brew install brew-cask
  successfully mkdir -p /usr/local/Library/Taps/my-casks/
  successfully ln -s $SCRIPT_DIR/Casks /usr/local/Library/Taps/my-casks/Casks

echo "Updating some tools, adding some others..."
  brew install coreutils
  echo "export PATH=/usr/local/opt/coreutils/libexec/gnubin:\$PATH" >> ~/.zshrc
  echo "export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:\$MANPATH" >> ~/.zshrc
  brew install git
  brew install unrar

echo "Installing essential software..."
  #export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  brew cask install dropbox
  brew cask install google-drive
  brew cask install google-chrome
  brew cask install spotify
  brew cask install skype
  brew cask install bartender
  brew cask install coconutbattery
  brew cask install 1password
  brew cask install atom
  brew cask install cleanmymac
  brew cask install cocktail
  brew cask install firefox
  brew cask install kaleidoscope
  brew cask install kid3
  brew cask install lingon-x
  brew cask install macaw
  brew cask install mpeg-streamclip
  brew cask install nicecast
  brew cask install omnigraffle
  brew cask install path-finder
  brew cask install slack
  brew cask install textexpander
  brew cask install tower
  brew cask install transmit
  brew cask install transmission
  brew cask install virtualhostx
