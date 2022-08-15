ZEPHYR_HOME=~/Projects/mattmc3/zephyr
#ZEPHYR_HOME=${ZDOTDIR:-~}/.zephyr
[[ -e $ZEPHYR_HOME ]] || {
  echo >&2 cloning zephyr...
  git clone --depth=1 --quiet --branch moar-pluginz-plz https://github.com/mattmc3/zephyr $ZEPHYR_HOME
}

function zephyr-clean {
  ZEPHYR_HOME=${ZEPHYR_HOME:-${ZDOTDIR:-~}/.zephyr}
  for d in $ZEPHYR_HOME/**/.external; do
    echo removing ${d:h:t}
    rm -rf $d
  done
}

zplugins=(
  # core
  utility
  directory
  editor
  environment
  history
  prompt
  completions

  # regular
  z
  zsh-bench
  zfunctions

  # deferred
  zsh-defer
  abbreviations
  syntax-highlighting

  # fish
  autosuggestions
  history-substring-search
)
for plugin in $zplugins; do
  source $ZEPHYR_HOME/plugins/$plugin/$plugin.plugin.zsh
done
unset plugin
