#!/bin/bash

help() {
    cat <<EOF
Usage: $0 [PYTHON]

Install poetry

Args:

    PYTHON    Python interpreter

Options:
 
    -h        Help text

EOF
}

if [[ -z $1 ]]; then
    echo "Set python interpreter" >&2
    help
    exit 1
fi

if [ $1 = "-h" ]; then
    help
fi


curl -sSL https://install.python-poetry.org | $1 -

# Автодополнение
if [ ! -d $ZSH_CUSTOM/plugins/poetry ]; then
    mkdir $ZSH_CUSTOM/plugins/poetry
    poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi

poetry config virtualenvs.in-project true
