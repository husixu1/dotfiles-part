#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
    shell
)
declare -a deps
declare -a opts=(ISROOT DISTRO)

if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=(
            yay
            fi:/usr/share/LS_COLORS/LS_COLORS::aur:lscolors-git
        )
    fi
fi

export deps tags opts

## Dotfiles ####################################################################
bootstrap:install() {
    NewDir "$HOME/.bashrc.d"
    Link "$THISDIR/101-ls-colors.sh" "$HOME/.bashrc.d/101-ls-colors.sh"
}
