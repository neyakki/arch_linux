#!/bin/bash

source utils.sh

help() {
    cat <<EOF
Usage: $0 [-d]

Install theme

Options:

-d  The type of cached data to clear

    * 1 – Clears only the page cache. Default
    * 2 – Clears dentries and inodes.
    * 3 – Clears page cache, dentries, and inodes.

-h  Help text

EOF
}

echo "Copy config"

if [ $1 -eq "catppuccin-mocha" ]; then
    cp config/.bashrc ~
    cp config/.zshrc ~
    cp -r config/.config ~
    cp -r config/.local ~
fi
