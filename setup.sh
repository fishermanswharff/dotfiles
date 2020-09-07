if [[ -f ~/.zshrc ]]; then
  rm ~/.zshrc
fi


function setup(){
  rsync \
    -avh \
    --no-perms \
    .aliases \
    .curlrc \
    .rvmrc \
    .exports \
    .gitconfig \
    .git-completion \
    .gitignore \
    .path \
    .zshrc \
    ~;
  # source ~/.zshrc
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
  setup;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    setup;
  fi;
fi;
unset setup;

# source ~/.zshrc
