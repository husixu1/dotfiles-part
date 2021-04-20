#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
    x11
    app
)
declare -a deps
declare -a opts=(ISROOT DISTRO)

if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=(yay e:xava::aur:xava)
    fi
fi

export deps tags opts

## Dotfiles ####################################################################
bootstrap:install() {
    Link "$THISDIR/xava" "$LOCAL_CONFIG_DIR/xava"
}
