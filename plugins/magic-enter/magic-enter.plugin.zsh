ZSH=${ZSH:-$ZPLUGINDIR/ohmyzsh}
[[ -d "$ZSH" ]] || plugin-clone ohmyzsh/ohmyzsh
source $ZSH/plugins/magic-enter/magic-enter.plugin.zsh

# magic-enter plugin config
if [[ "$OSTYPE" == darwin* ]]; then
  MAGIC_ENTER_OTHER_COMMAND='ls -G'
else
  MAGIC_ENTER_OTHER_COMMAND='ls --color=auto'
fi
MAGIC_ENTER_GIT_COMMAND="$MAGIC_ENTER_OTHER_COMMAND && git status -sb"
