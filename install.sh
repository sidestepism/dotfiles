# Makesure using Homebrew
brew update

# Update already-installed formula
# upgrade

# Add repositories
brew tap homebrew/versions || true
brew tap caskroom/cask || true
brew tap caskroom/versions || true

# Update Homebrew
brew update || true

# Install formulae
brew install brew-cask || true
brew install zsh || true
brew install wget || true

brew tap phinze/homebrew-cask || true
brew tap homebrew/binary || true

# Packages for development
brew install brew-cask
brew install zsh
brew install git
brew install vim

# .dmg from brew-cask
brew cask install iterm2 || true
brew cask install java || true
brew cask install google-chrome || true
brew cask install virtualbox || true
brew cask install vagrant || true
brew cask install kobito || true
brew cask install evernote  || true
brew cask install google-japanese-ime || true
brew cask install sublime-text  || true

brew cask install google-hangouts

brew cask install sequel-pro
brew cask install mendeley-desktop
# si .cask install keyremap4macbook-mountainlion
brew cask install pycharm-ce
brew cask install ripit
brew cask install robomongo
brew cask install skype
brew cask install soundflower
brew cask install the-unarchiver
brew cask install transmit
brew cask install yorufukurou
brew cask install onepassword
brew cask install audacity
brew cask install bathyscaphe
brew cask install disk-inventory-x
brew cask install adobe-air alarm-clock arduino 
brew cask install dropbox
brew cask install clamxav
brew cask install coteditor
brew cask isntall ffmpegx
brew cask install flip4mac
brew cask install flash-player
brew cask install github
brew cask install heroku-toolbelt
brew cask install slack
brew cask install robomongo

# Remove outdated versions
brew cleanup

brew install git
brew install subversion
# JDK8
brew cask install java
# languages
brew install go
brew install node
brew install pyenv
brew install rbenv

# development
brew install nginx
brew install elasticsearch
brew install julius
brew install jpeg
brew install libpng
brew install ffmpeg
brew install ghc
brew install glib
brew install zlib
brew install vim
brew install mongodb
# sound 
brew install sox
# movie 
brew install opencv
brew install openssl
brew install qr
# other tools
brew install tree
brew install haskell-platform
brew install bash-completion
brew install lame