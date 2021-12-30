#!/usr/bin/env bash
#
# bootstrap install things
password=$1
install_homebrew () {
  if test ! $(which brew)
  then
    echo " Install Homebrew..."
    if test "$(uname)" = "Darwin"
    then
      #ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
      
      # for macbook pro m1
      if [[ `uname -m` == 'arm64' ]]; then
        echo 'export PATH to .zshrc'
        echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
      fi
    fi
  else
    echo " Homebrew has been installed"
  fi
}

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change  
osascript -e 'tell application "System Preferences" to quit'


sudo -v

install_homebrew

if [ "$(uname -s)" == 'Darwin' ]
then
  echo "installing dependencies"
  if source bin/dot
  then
    echo "dependencies installed"#
  else
    echo "error installing dependencies"
  fi
fi

echo ''
echo '  All installed!'
