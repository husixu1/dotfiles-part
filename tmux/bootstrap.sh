#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
)
declare -a deps
declare -a opts=(ISROOT DISTRO)

if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=(e:tmux)
    fi
fi

export deps tags opts

## Dotfiles ####################################################################
bootstrap:install() {
    Link "$THISDIR/tmux.conf" "$HOME/.tmux.conf"
    # here bdm should not hold the ownership of the .local file
    cp -n "$THISDIR/tmux.conf.local" "$HOME/.tmux.conf.local"
}

