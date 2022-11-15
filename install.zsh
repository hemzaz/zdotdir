#!/usr/bin/env zsh
export ZDOTDIR=~/.config/zsh
git clone --recursive https://github.com/hemzaz/zdotdir.git $ZDOTDIR
starship preset pure-preset >$ZDOTDIR/starship.toml
cat <<'EOF' >|~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF
rm -rf $ZDOTDIR/.git*
