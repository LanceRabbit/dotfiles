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
    fi
  else
    echo " Homebrew has been installed"
  fi
}

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
