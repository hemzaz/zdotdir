# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# prezto
[[ -d $ZDOTDIR/.zprezto ]] ||
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $ZDOTDIR/.zprezto
[[ -d $ZDOTDIR/.zprezto-contrib ]] ||
  git clone --recursive git@github.com:mattmc3/prezto-contrib $ZDOTDIR/.zprezto-contrib
source $ZDOTDIR/.zprezto/init.zsh

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
