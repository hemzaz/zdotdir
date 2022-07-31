# zprof comes first in case we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# prezto
ZPLUGINDIR=$ZDOTDIR/.external
ZCONTRIBDIR=$ZDOTDIR/contrib
ZPREZTODIR=$ZDOTDIR/.zprezto
[[ -d $ZPREZTODIR ]] ||
  git clone --depth 1 --recursive --shallow-submodules https://github.com/sorin-ionescu/prezto $ZPREZTODIR

source $ZPREZTODIR/init.zsh
source $ZDOTDIR/.aliases

# local settings
[[ -f $ZDOTDIR/.zshrc.local ]] && . $ZDOTDIR/.zshrc.local
[[ -f $ZDOTDIR/functions.local ]] && autoload-dir $ZDOTDIR/functions.local

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
