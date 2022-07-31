# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# dirs
export ZSH="${ZDOTDIR:-$HOME}/.oh-my-zsh"
export ZSH_CUSTOM=${ZDOTDIR:-$HOME}/custom

# customizations
zstyle ':omz:update' mode disabled
HIST_STAMPS="yyyy-mm-dd"
DISABLE_AUTO_UPDATE=true
ZSH_DISABLE_COMPFIX=true
ZSH_COMPDUMP=${ZDOTDIR:-$HOME}/.zcompdump
ZPLUGINDIR=${ZDOTDIR:-$HOME}/.zplugins

# theme
ZSH_THEME=refined

# plugins
plugins=(
  zfunctions
  xdg
  zsh-bench
  dash
  extract
  fancy-ctrl-z
  omz-git
  macos
  magic-enter
  z
  autosuggestions
  fast-syntax-highlighting
  history-substring-search
)

# clone if necessary
[[ -d $ZSH ]] || \
  git clone https://github.com/ohmyzsh/ohmyzsh $ZSH

# init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# other
source ${ZDOTDIR:-$HOME}/.aliases

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
