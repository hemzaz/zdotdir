[[ -d $ZPLUGINDIR/zsh-autosuggestions ]] || plugin-clone zsh-users/zsh-autosuggestions
source $ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
if [[ -n "$key_info" ]]; then
  # vi
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi
