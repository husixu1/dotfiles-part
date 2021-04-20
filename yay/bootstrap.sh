#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
    helper
)
declare -a deps
declare -a opts=(ISROOT DISTRO)

if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=(gnu-tools git e:yay::f:install_yay)
    else
        log:error "yay: yay cannot be installed on $DISTRO"
        exit 1
    fi
else
    log:error "yay: yay cannot be installed in usermode."
    exit 1
fi

export deps tags opts

install_yay() {
    local tempdir
    tempdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tempdir"
    pushd "$tempdir" || exit 1
    makepkg --needed --noconfirm -si
    popd || exit 1
    rm -rf "$tempdir"
}

## Dotfiles ####################################################################
bootstrap:install() { :; }
