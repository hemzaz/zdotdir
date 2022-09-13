#
# .zshrc
#

# Profiling
# load zprof first thing in case we want to profile performance
[[ ${ZSH_PROFILE:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZSH_PROFILE=1 zsh"

# history
HISTFILE=${XDG_DATA_HOME:-~/.local/share}/zsh/history
[[ -f $HISTFILE ]] || { mkdir -p ${HISTFILE:h} && touch $HISTFILE }
HISTSIZE=10000  # session history
SAVEHIST=10000  # saved history

# zfunctions
export ZFUNCDIR=${ZDOTDIR:-~/.config/zsh}/functions
fpath=($fpath $ZFUNCDIR(/N))
for _fnfile in $ZFUNCDIR/*(.N); do
  autoload -Uz "${_fnfile:t}"
done
unset _fnfile

# conf.d
for _conf in $ZDOTDIR/conf.d/*.zsh(.N); do
  source $_conf
done
unset _conf

# done profiling
[[ ${ZSH_PROFILE:-0} -eq 0 ]] || { unset ZSH_PROFILE && zprof }
true
