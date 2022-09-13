#region profiling
# load zprof first thing in case we want to profile performance
[[ ${ZSH_PROFILE:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZSH_PROFILE=1 zsh"
#endregion

#region history
HISTFILE=${XDG_DATA_HOME:-~/.local/share}/zsh/history
[[ -f $HISTFILE ]] || { mkdir -p ${HISTFILE:h} && touch $HISTFILE }
HISTSIZE=10000  # session history
SAVEHIST=10000  # saved history
#endregion

#region zfunctions
export ZFUNCDIR=${ZDOTDIR:-~/.config/zsh}/functions
fpath=($fpath $ZFUNCDIR(/N))
for _fnfile in $ZFUNCDIR/*(.N); do
  autoload -Uz "${_fnfile:t}"
done
unset _fnfile
#endregion

#region plugins
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-~}/.zplugins}

plugin load --kind:fpath sindresorhus/pure
plugin load --kind:path romkatv/zsh-bench

# defer
plugin load --kind:defer olets/zsh-abbr
plugin load --kind:defer zdharma-continuum/fast-syntax-highlighting

plugin load --path:completion belak/zsh-utils
plugin load --path:editor belak/zsh-utils
plugin load --path:history belak/zsh-utils
plugin load --path:prompt belak/zsh-utils
plugin load --path:utility belak/zsh-utils
plugin load --path:plugins/magic-enter ohmyzsh/ohmyzsh
plugin load rupa/z
plugin load mattmc3/zman
plugin load mattmc3/zsh-safe-rm
plugin load zshzoo/magic-enter
plugin load zshzoo/macos
#plugin load zshzoo/fancy-ctrl-z
#plugin load zshzoo/extract
plugin load olets/zsh-window-title
plugin load zsh-users/zsh-autosuggestions
plugin load zsh-users/zsh-history-substring-search
#endregion

#region plugin config
## zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
if [[ -n "$key_info" ]]; then
  # vi
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi

## olets/zsh-abbr
ABBR_USER_ABBREVIATIONS_FILE=$ZDOTDIR/.zabbr

## zsh-users/zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

if [[ -n "$key_info" ]]; then
  # Emacs
  bindkey -M emacs "$key_info[Control]P" history-substring-search-up
  bindkey -M emacs "$key_info[Control]N" history-substring-search-down

  # Vi
  bindkey -M vicmd "k" history-substring-search-up
  bindkey -M vicmd "j" history-substring-search-down

  # Emacs and Vi
  for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Up]" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Down]" history-substring-search-down
  done

  unset keymap
fi

## pure prompt
# show exit code on right
precmd_pipestatus() {
  local exitcodes="${(j.|.)pipestatus}"
  if [[ "$exitcodes" != "0" ]]; then
    RPROMPT="%F{$prompt_pure_colors[prompt:error]}[$exitcodes]%f"
  else
    RPROMPT=
  fi
}
add-zsh-hook precmd precmd_pipestatus

# https://unix.stackexchange.com/questions/685666/zsh-how-do-i-remove-block-prefixes-when-writing-multi-line-statements-in-intera
# use 2 space indent for each new level
PS2='${${${(%):-%_}//[^ ]}// /  }    '
#endregion

#region: options
# https://zsh.sourceforge.io/Doc/Release/Options.html

# expansion and globbing
setopt extended_glob           # use more awesome globbing features
setopt glob_dots               # include dotfiles when globbing

# input/output
setopt no_clobber              # must use >| to truncate existing files
setopt no_correct              # don't try to correct the spelling of commands
setopt no_correct_all          # don't try to correct the spelling of all arguments in a line
setopt no_flow_control         # disable start/stop characters in shell editor
setopt interactive_comments    # enable comments in interactive shell
setopt no_mail_warning         # don't print a warning message if a mail file has been accessed
setopt path_dirs               # perform path search even on command names with slashes
# setopt rc_quotes               # allow 'Henry''s Garage' instead of 'Henry'\''s Garage'

# # job control
# setopt auto_resume            # attempt to resume existing job before creating a new process
# setopt no_bg_nice             # don't run all background jobs at a lower priority
# setopt no_check_jobs          # don't report on jobs when shell exit
# setopt no_hup                 # don't kill jobs on shell exit
# setopt long_list_jobs         # list jobs in the long format by default
# setopt notify                 # report status of background jobs immediately

# # zle
setopt no_beep                # be quiet!
setopt emacs                  # use emacs keybindings in the shell
#endregion

#region: init
compstyle zshzoo
prompt pure
source $ZDOTDIR/.zaliases
#endregion

#region footer
[[ ${ZSH_PROFILE:-0} -eq 0 ]] || { unset ZSH_PROFILE && zprof }
true
#endregion
