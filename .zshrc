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
ZSH_COMPDUMP=$ZDOTDIR/.zcompdump

# theme
ZSH_THEME=refined

# plugins
plugins=(
  autosuggestions
  zsh-defer
  magic-enter
  git
  z
  fast-syntax-highlighting
  history-substring-search
)

# clone if necessary
[[ -d $ZSH ]] || \
  git clone https://github.com/ohmyzsh/ohmyzsh $ZSH
[[ -d $ZSH_CUSTOM ]] || \
  git clone git@github.com:mattmc3/zsh_custom $ZSH_CUSTOM

# init zsh_custom
fpath+=$ZSH_CUSTOM/functions
autoload -Uz custominit && custominit

# init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# other
source $ZDOTDIR/.aliases

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
