#!/bin/bash
eval "$(cat "$BDM_LIBDIR/bootstrap_imports.sh")"

## Dependencies ################################################################

declare -a tags=(
    support:root
    support:non-root
    distro:arch
    distro:debian
    distro:termux
    app
)
declare -a deps
declare -a opts=(ISROOT DISTRO CONF__vim__preset)

if [[ "${CONF__vim__preset}" == server ]]; then
    # We use a smaller set of dependencies for server mode installation
    # to avoid permission issues.
    deps=('d:bash' 'cmake' 'wget' 'curl' 'git' 'e:vim')
else
    if $ISROOT; then
        # root installation
        deps=('d:gnu-tools' 'd:bash' 'cmake' 'wget' 'curl' 'git' 'clang' 'global')

        if [[ $DISTRO == arch ]]; then
            deps+=(
                'yay'
                'ctags' 'lua' 'ruby' 'perl' 'tclsh::tcl' 'python2' 'python3::python'
                'npm::npm' 'node::nodejs'
                'e:vim::gvim'
            )
        elif [[ $DISTRO =~ ^debian ]]; then
            # only vim-nox supports python
            deps+=(
                'ctags' 'lua' 'ruby' 'perl' 'tclsh::tcl'
                'python2::python' 'python3::python3' 'npm::npm' 'node::nodejs'
                'e:vim::vim-nox'
            )
        elif [[ $DISTRO == termux ]]; then
            deps+=(
                'ctags'
                'lua54' 'ruby' 'perl' 'tclsh::tcl' 'python2' 'python3::python'
                'node::nodejs'
                'e:vim::vim vim-python'
            )
        fi
    else
        deps=(
            'd:gnu-tools d:bash'
            'cmake::devel/cmake' 'wget::net/wget' 'curl::www/curl' 'git::devel/git'
            'ctags::devel/exctags'
            'e:vim::editors/vim'
            'e:npm::lang/npm'
            'e:nodejs::lang/nodejs'
            'e:clang::lang/clang'
            'e:ctags::devel/exctags'
        )
    fi
fi

export deps tags opts

## Dotfiles ####################################################################

VIMDIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

bootstrap:install() {
    # generate preset config. It'll be sourced by the vimrc file
    echo "let g:preset = '${CONF__vim__preset:-desktop}'" >| \
        "$THISDIR/vim/custom/bdm_config.vim"

    # link files
    Link "$THISDIR/vimrc" "$VIMRC"
    Link "$THISDIR/vim" "$VIMDIR"

    # download plug.vim to autoload dir.
    # This file is ignored by .gitignore
    if ! [[ -f $THISDIR/vim/autoload/plug.vim ]]; then
        curl -fLo "$THISDIR/vim/autoload/plug.vim" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    # coc.vim support
    NewDir "$LOCAL_CONFIG_DIR/coc"

    # nvim support
    NewDir "$LOCAL_CONFIG_DIR"
    Link "$THISDIR/vim" "$LOCAL_CONFIG_DIR/nvim"
    # alredy installed as relative link
    # Link "$THISDIR/vimrc" "$LOCAL_CONFIG_DIR/nvim/init.vim"

    # export $EDITOR variable for shells
    NewDir "$LOCAL_CONFIG_DIR/fish/conf.d"
    Link "$THISDIR/90-default-editor.fish" "$LOCAL_CONFIG_DIR/fish/conf.d/90-default-editor.fish"
    NewDir "$HOME/.bashrc.d"
    Link "$THISDIR/90-default-editor.sh" "$HOME/.bashrc.d/90-default-editor.sh"
    NewDir "$HOME/.zshrc.d"
    Link "$THISDIR/90-default-editor.zsh" "$HOME/.zshrc.d/90-default-editor.zsh"

    # install plugins via vim-plug
    vim '+PlugUpgrade' '+PlugInstall' '+qall'
}
