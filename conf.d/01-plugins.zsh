ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-~}/.zplugins}
autoload -Uz $ZDOTDIR/functions/plugin

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
plugin load olets/zsh-window-title
plugin load zsh-users/zsh-autosuggestions
plugin load zsh-users/zsh-history-substring-search
