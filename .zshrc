# load envman
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

[[ ${ZPROFRC:-0} -eq 0 ]] ||
    zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# set vars
export NVM_LAZY=1
export NVM_AUTOLOAD=1
export ZSH_COLORIZE_TOOL="chroma"
export ZSH="${ZDOTDIR:-$HOME}/.ohmyzsh"
export ZSH_CUSTOM=${ZDOTDIR:-$HOME}/custom
export HYPHEN_INSENSITIVE="true"
export ENABLE_CORRECTION="true"
export COMPLETION_WAITING_DOTS="true"
export STARSHIP_CONFIG="${ZDOTDIR:-$HOME}/starship.toml"
# clone omzh if needed
[[ -d $ZSH ]] ||
    git clone https://github.com/ohmyzsh/ohmyzsh $ZSH

#autoload completions
autoload -Uz compinit
compinit

# set omz update to auto
zstyle ':omz:update' mode auto

# autoload functions
autoload -Uz $ZDOTDIR/functions/autoload-dir
autoload-dir $ZDOTDIR/functions

# config antidote
ANTIDOTE_HOME=$ZDOTDIR/plugins/.external
ANTIDOTE_DIR=$ZDOTDIR/.antidote

zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:bundle' file $ZDOTDIR/.zplugins.txt

# load antidote
if [[ ! $ZDOTDIR/.zplugins.zsh -nt $ZDOTDIR/.zplugins ]]; then
    [[ -e $ANTIDOTE_DIR ]] ||
        git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE_DIR
    (
        source $ANTIDOTE_DIR/antidote.zsh
        envsubst <$ZDOTDIR/.zplugins | antidote bundle >$ZDOTDIR/.zplugins.zsh
    )
fi
autoload -Uz $ANTIDOTE_DIR/functions/antidote
source $ZDOTDIR/.zplugins.zsh
antidote load

# docker plugins
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# load OMZH
source $ZSH/oh-my-zsh.sh
# load aliases
source $ZDOTDIR/.zaliases

# load programming env
source $ZDOTDIR/.zshlocal

# load fzf
[ -f ${ZDOTDIR:-$HOME}/.fzf.zsh ] &&
    source ${ZDOTDIR:-$HOME}/.fzf.zsh
# load cheat-fzf
[ -f ${ZDOTDIR:-$HOME}/plugins/cht-fzf.sh ] &&
    source ${ZDOTDIR:-$HOME}/plugins/cht-fzf.sh
# local settings
[[ ! -f $DOTFILES.local/zsh/zshrc_local.zsh ]] || source $DOTFILES.local/zsh/zshrc_local.zsh

# load starship
eval "$(starship init zsh)"

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] ||
    unset ZPROFRC && zprof
