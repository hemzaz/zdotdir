if [[ -n "$ZDOTDIR" ]]; then
  ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
else
  ZFUNCDIR=${ZFUNCDIR:-~/.zfunctions}
fi
[[ -d "$ZFUNCDIR" ]] || mkdir -p $ZFUNCDIR
fpath+=$ZFUNCDIR
for _fn in $ZFUNCDIR/*(.N); do
  autoload -Uz ${_fn:t}
done
unset _fn
