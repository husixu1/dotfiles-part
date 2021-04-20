#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    support:non-root
    distro:arch
    shell
)
declare -a deps
declare -a opts=()

deps=('git' 'e:bash::f:install_bash' "file:$HOME/.oh-my-bash::f:install_omb")

export deps tags opts

install_omb() {
    git clone git://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
}

install_bash() {
    error "How the hell did you run this script without bash???"
    return 1
}

## Dotfiles ####################################################################
bootstrap:install() {
    # Usually linux system comes with a default bashrc,
    # so we back it up here automatically to avoid requiring manual removal.
    if [[ (-f $HOME/.bashrc && ! -L $HOME/.bashrc) || (-L \
        $HOME/.bashrc && ! $HOME/.bashrc -ef "$THISDIR/bashrc") ]]; then
        mv "$HOME/.bashrc" "$HOME/.bashrc.bak_$(date +%F_%T)"
    fi
    Link "$THISDIR/bashrc" "$HOME/.bashrc"
}

bootstrap:post_install() {
    # shellcheck disable=SC1090
    # immediately apply new content in bashrc
    source "$HOME/.bashrc"
}
