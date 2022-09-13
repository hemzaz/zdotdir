### misc

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

#region: ohmyzsh/ohmyzsh
# using omz without sourcing its lib requires a few helpers
alias open_command=open

# magic-enter plugin config
if [[ "$OSTYPE" == darwin* ]]; then
  MAGIC_ENTER_OTHER_COMMAND='ls -G'
else
  MAGIC_ENTER_OTHER_COMMAND='ls --color=auto'
fi
MAGIC_ENTER_GIT_COMMAND="$MAGIC_ENTER_OTHER_COMMAND && git status -sb"

alias pbc=clipcopy
alias pbp=clippaste
#endregion

#region: zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
if [[ -n "$key_info" ]]; then
  # vi
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi
#endregion

#region: olets/zsh-abbr
ABBR_USER_ABBREVIATIONS_FILE=$ZDOTDIR/.zabbr
#endregion

#region: zsh-users/zsh-history-substring-search
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
#endregion
