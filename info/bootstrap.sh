#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
    app
)
declare -a deps
declare -a opts=(ISROOT DISTRO)

if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=(e:info::texinfo)
    fi
fi

export deps tags opts

## Dotfiles ####################################################################
bootstrap:install() {
    Link "$THISDIR/infokey" "$HOME/.infokey"
}

