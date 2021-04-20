#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################
declare -a tags=(
    support:root
    distro:arch
    distro:debian
    helper
)
declare -a deps
declare -a opts=(ISROOT DISTRO)


if $ISROOT; then
    # root installation
    deps=()
    if [[ $DISTRO == arch ]]; then
        deps+=("fu:check_gnu_tools::base-devel")
    elif [[ $DISTRO =~ ^debian ]]; then
        deps+=("fu:check_gnu_tools::build-essential autoconf automake \
            libtool libtool-bin m4 flex bison pkg-config gawk")
    fi
else
    deps=("fu:check_gnu_tools::devel/autoconf devel/automake devel/libtool \
        devel/m4 devel/gmake devel/flex devel/bison devel/patch \
        devel/pkg-config devel/binutils devel/gettext lang/gawk \
        textproc/groff textproc/grep textproc/gsed \
        sysutils/fakeroot sysutils/file sysutils/findutils archivers/gzip")
fi

export deps tags opts

_check_gnu_tools() {
    local -a exes=(
        autoconf automake libtool libtoolize m4 make
        bison flex gcc g++ groff patch pkg-config
        ld ar strip # binutils package on archlinux
        gawk gettext grep sed
        fakeroot file find gzip which
        info # 'texinfo' package on archlinux
    )

    for exe in "${exes[@]}"; do
        if ! command -v "$exe" >/dev/null 2>&1; then
            echo "$exe"
        fi
    done
}

check_gnu_tools() {
    local result
    result=$(_check_gnu_tools)
    if [[ -n $result ]]; then
        return 1
    fi
    return 0
}

## Dotfiles ####################################################################
bootstrap:install() { :; }
