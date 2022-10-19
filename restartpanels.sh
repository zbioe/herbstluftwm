#!/usr/bin/env bash

installdir=/

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
defaultpanel="$XDG_CONFIG_HOME/herbstluftwm/panel.sh"

[ -x "$defaultpanel" ] || defaultpanel="$installdir/nix/store/z8mc9474p14i11qhxxsbc9k7b15cs9fk-herbstluftwm-0.9.3/etc/xdg/herbstluftwm/panel.sh"

panelcmd="${1:-$defaultpanel}"

herbstclient emit_hook quit_panel

for i in $(herbstclient list_monitors | cut -d':' -f1) ; do
    "$panelcmd" $i &
done
