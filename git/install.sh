 #!/bin/bash

git_configig=~/.gitconfig
git_ignore=~/.gitignore_global

LIST=(.gitconfig .gitignore_global)

for config in "${LIST[@]}";
do
  path=~/${config}
  echo $path
  if [ -L ${path} ] ; then
    if [ -e ${path} ] ; then
      echo "Good link"
    else
      echo "Broken link"
    fi
  elif [ -e ${path} ] ; then
    echo "Not a link"
  else
    echo "Missing - symbolic the $config"
    # echo $PWD/$config
    # f: force, overriding file directly
    ln -s $PWD/git/$config $path
  fi
done

# ln -s ./.gitconfig ~/.gitconfig
# ln -s ./.gitignore_global ~/.gitignore_global
