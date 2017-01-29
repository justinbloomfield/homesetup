#!/bin/sh

echo -n "Packager: "
read PKGR
echo $PKGR
echo -n "Packager install command: "
read PKGR_INST
echo $PKGR_INST

PKGGET="sudo $PKGR $PKGR_INST"
DFURL='https://github.com/justinbloomfield/dotfiles'

getinitpkg () {
    $PKGGET git stow 
}

createdirs () {
    mkdir -p ~/etc && touch ~/etc/info
    mkdir -p ~/src/{pkg,go,hsk,c}
    mkdir -p ~/usr/{dl,img,vid,doc}
    mkdir -p ~/var/{mail,fifo,logs,tox}
}

dotfiles () {
    git clone $DFURL ~/.df
    cd ~/.df
    mv README.md ..
    stow *
    mv ../README.md .
}

getinitpkg
createdirs
dotfiles
