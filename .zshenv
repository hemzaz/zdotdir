# ~/.zshenv should only be a one-liner that sources this file
# echo "source ~/.zsh/.zshenv" >| ~/.zshenv
export ZDOTDIR=~/.zsh

# Set XDG dirs
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_RUNTIME_DIR=~/.xdg

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s ${ZDOTDIR:-~}/.zprofile ]]; then
  source ${ZDOTDIR:-~}/.zprofile
fi
