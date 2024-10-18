#!/bin/bash

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

help() {
    cat <<EOF
Usage: $0 [-v]

Install python from source code

Options:

-v  List python version (split ' ') 
-h  Help text

EOF
}

log() {
    if [ -z "$2" ]; then
        local color=$GREEN
        local msg=$1
    else
        local color=$1
        local msg=$2
    fi
    echo -e "$color$msg$NC"
}

function create_dir {
    local dir=$1
    if [ -d $dir ]; then
        mkdir -p $dir 
    fi
}

if [[ -z $1 || $1 != "-v" && $1 != "-h" ]]; then
    echo "Set options -v (version)" >&2
    help
    exit 1
fi

if [ $1 = "-h" ]; then
    help
fi

USER_NAME=$SUDO_USER
HOME=/home/$USER_NAME
DIR_OPT_PYTHON=$HOME/opt/python
create_dir $DIR_OPT_PYTHON
cd /tmp

log "Install python deps"

pacman -S --noconfirm bzip2 expat gdbm libffi libxcrypt openssl zlib bluez-libs gdb mpdecimal tk xz sqlite libnsl llvm python-pip python-setuptools

while true; do
    shift

    if [ -z $1 ]; then
        break
    fi
    
    version=$1
    log $GREEN "Install python version $version"

    ftp_site=https://www.python.org/ftp/python/
    last_version=$(curl -s $ftp_site | grep $(echo $version | sed 's/\./\\./g') | sed -n 's/.*href="\(3\.[0-9]*\.[0-9]*\)\/".*/\1/p' | sort -V | tail -n 1)
    arch_python=$(curl -s "$ftp_site$last_version/" | sed -n 's/.*href="\([^"]*\.tgz\)".*/\1/p')
    arch_dir_python=$(echo $arch_python | sed 's/\.tgz//')
    
    wget -q "$ftp_site$last_version/$arch_python"
    tar xvf $arch_python && cd $arch_dir_python
    
    python=python$(echo $version | sed 's/\.//g')
    python_dir="$DIR_OPT_PYTHON/$python"
    
    log $GREEN "The python will be installed in the directory $python_dir"

    create_dir $python_dir

    ./configure --prefix=$python_dir --enable-optimizations --with-lto --with-computed-gotos --with-system-ffi

    make -j "$(nproc)"
    make altinstall
    
    cd ..
    rm -rf $arch_python $arch_dir_python

    log $GREEN "Python is installed. Command for run $python" 

    ln -s $python_dir/bin/python$version $HOME/.local/bin/$python
done

