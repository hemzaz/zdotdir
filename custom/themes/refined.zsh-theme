source $ZSH/themes/refined.zsh-theme
PROMPT=${PROMPT:gs/❯/%%}  # use % instead of ❯

# https://unix.stackexchange.com/questions/685666/zsh-how-do-i-remove-block-prefixes-when-writing-multi-line-statements-in-intera
# use 2 space indent for each new level
PS2='${${${(%):-%_}//[^ ]}// /  }    '
