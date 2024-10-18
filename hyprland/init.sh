#!/bin/bash

function base {
    echo "Install base packages"
    #pacman -Suu
    #source scripts/base/git.sh
    #source scripts/base/packages.sh
    #source scripts/base/aur_packages.sh
}

function optional {
    echo "Install optional app"
    OPTS=$(getopt -o '-t:' \
        --long theme:,zsh,code,obsidian,telegram,nekoray,docker \
    -- "$@")
    if [ $? != 0 ]; then
        echo "Failed to parse options." >&2
        exit 1
    fi

    eval set -- "$OPTS"

    while true; do
        case "$1" in
            -t | --theme )  source scripts/install_theme.sh $2; shift ;;
            --zsh )         source scripts/optional/zsh.sh; shift ;;
            --code )        source scripts/optional/code.sh; shift ;;
            --obsidian )    source scripts/optional/obsidian.sh; shift ;;
            --telegram )    source scripts/optional/telegram.sh; shift ;;
            --nekoray )     source scripts/optional/nekoray.sh; shift ;;
            --docker )      source scripts/optional/docker.sh; shift ;;
            -- )            shift; break ;;
            * )             break ;;
        esac
    done
}

base
config
optional $@


