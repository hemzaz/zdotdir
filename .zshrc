[[ -f $ZPLUGINDIR/zsh-snap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git $ZPLUGINDIR/zsh-snap
source $ZPLUGINDIR/zsh-snap/znap.zsh

# prompt
znap prompt sindresorhus/pure

# plugins
znap clone romkatv/zsh-bench
export PATH="$ZPLUGINDIR/zsh-bench:$PATH"
znap source sindresorhus/pure
znap source zsh-users/zsh-completions
znap source mattmc3/zephyr
znap source mattmc3/zsh-xdg-basedir
znap source mattmc3/zman
znap source ohmyzsh/ohmyzsh lib/clipboard.zsh
znap source ohmyzsh/ohmyzsh plugins/dash
znap source ohmyzsh/ohmyzsh plugins/extract
znap source ohmyzsh/ohmyzsh plugins/fancy-ctrl-z
znap source ohmyzsh/ohmyzsh plugins/magic-enter
znap source ohmyzsh/ohmyzsh plugins/macos
znap source mattmc3/zfunctions
znap source olets/zsh-window-title
znap source rupa/z
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-autosuggestions

source $ZDOTDIR/.aliases
