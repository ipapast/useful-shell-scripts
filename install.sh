#!/usr/bin/env bash
set -e

echo "Installing required dependencies on MacOS systems..."

installHomeBrew(){
 if which brew > /dev/null; then
    echo Homebrew is installed
 else
    echo Homebrew is not installed.
    echo Installing Homebrew....
    /usr/bin/ruby -e "$(curl -fsSL 
    https://raw.githubusercontent.com/Homebrew/install/master/install)"
 fi
 }

installNvm(){
   if brew ls --versions nvm > /dev/null; then
   echo "Nvm is already installed"
   else
   echo "Installing nvm..."
   brew install nvm
   fi
   source "$(brew --prefix nvm)/nvm.sh"
   mkdir -p ~/.nvm
   export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
   source "$(brew --prefix nvm)/nvm.sh"
}

installNode(){
   echo "Installing node 12..."
   nvm install 12
   nvm alias default 12
   nvm use default
}

installCommandLineTools(){
   echo "xcode command line tools:"
   if xcode-select -p 1>/dev/null; then
      echo 'xcode-select is installed' 
   else
      echo 'Installing xcode-select...'
      xcode-select --install
   fi
}

installRedis(){
   if brew ls --versions redis > /dev/null; then
   echo "Redis is already installed"
   else
   brew install redis
   fi
   brew services start redis
}

installPostgres(){
   if brew ls --versions postgresql@9.6 > /dev/null; then
      echo "Postgresql 9.6 is already installed"
   else
      echo "Installing postgresql..."
      brew install postgresql@9.6
      brew link postgresql@9.6 --force
   fi
      brew services start postgresql@9.6
}

#Running the functions
installHomeBrew
installNvm
installNode
installCommandLineTools
installRedis
installPostgres