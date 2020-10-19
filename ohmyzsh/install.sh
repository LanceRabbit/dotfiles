#!/usr/bin/env bash
#
# Install oh-my-zsh

## Clone the repo
if [ ! -d ~/.oh-my-zsh ]
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
  
  mkdir -p .oh-my-zsh/custom/plugins
  cd .oh-my-zsh/custom/plugins

  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  chsh -s /bin/zsh

else
  echo 'Already installed Oh my zsh'
fi