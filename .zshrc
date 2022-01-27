# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# functions
() {
  fpath+="$ZDOTDIR/functions"
  local fn
  for fn in $ZDOTDIR/functions/**/*(.N); do
    autoload -Uz "$fn"
  done
}

# prezto
ZCONTRIBDIR=$ZDOTDIR/.zprezto-contrib
ZPREZTODIR=$ZDOTDIR/.zprezto
[[ -d $ZCONTRIBDIR ]] ||
  git clone --recursive git@github.com:mattmc3/prezto-contrib $ZCONTRIBDIR
[[ -d $ZPREZTODIR ]] ||
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $ZPREZTODIR
source $ZCONTRIBDIR/init.zsh
source $ZPREZTODIR/init.zsh

# plugins
plugin loadall
MAGIC_ENTER_GIT_COMMAND="git status -sb"
MAGIC_ENTER_OTHER_COMMAND="ls -G"

# local settings
[[ -f $ZDOTDIR/.zshrc.local ]] && . $ZDOTDIR/.zshrc.local
[[ -f $ZDOTDIR/functions.local ]] && autoload-dir $ZDOTDIR/functions.local

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
