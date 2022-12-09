if [ -L ~/.tmux.conf ] ; then
  echo "tmux.conf exists!"
fi

ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
