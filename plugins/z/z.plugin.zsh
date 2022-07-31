[[ -d $ZPLUGINDIR/z ]] || plugin-clone rupa/z
_Z_DATA=${XDG_DATA_HOME:-~/.local/share}/z/data
[[ -f $_Z_DATA ]] || { mkdir -p "${_Z_DATA:t}" && touch "$_Z_DATA" }
source $ZPLUGINDIR/z/z.plugin.zsh
