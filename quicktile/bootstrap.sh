#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
    x11
)
declare -a deps
declare -a opts=(ISROOT DISTRO)

if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=(e:quicktile::aur:quicktile)
    fi
fi

export deps tags opts

## Dotfiles ####################################################################
bootstrap:install() {
    NewDir "$HOME/.local/bin"
    Link "$THISDIR/quicktile-daemon" "$HOME/.local/bin/quicktile-daemon"

    NewDir "$LOCAL_CONFIG_DIR/autostart"
    Link "$THISDIR/quicktile-daemon.desktop" \
        "$LOCAL_CONFIG_DIR/autostart/quicktile-daemon.desktop"

    Link "$THISDIR/quicktile.cfg" "$LOCAL_CONFIG_DIR/quicktile.cfg"
}

