# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

[[ -f $ZPLUGINDIR/zsh-snap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git $ZPLUGINDIR/zsh-snap
source $ZPLUGINDIR/zsh-snap/znap.zsh

# config
zstyle ':zephyr:*:*' use-xdg-basedirs 'true'
zstyle ':zephyr:plugin:completions' skip-compinit 'true'

# prompt
znap prompt sindresorhus/pure

# plugins
znap clone romkatv/zsh-bench
export PATH="$ZPLUGINDIR/zsh-bench:$PATH"
znap source sindresorhus/pure
znap source mattmc3/zfunctions
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
znap source olets/zsh-window-title
znap source rupa/z
znap source mattmc3/zshrc.d
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-autosuggestions

# local settings
[[ ! -f $DOTFILES.local/zsh/zshrc_local.zsh ]] || source $DOTFILES.local/zsh/zshrc_local.zsh

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
