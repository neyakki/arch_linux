#!/bin/bash

opt_dir=~/opt
local_bin=~/.local/bin

if [ ! -d $opt_dir ]; then
    echo "Create opt dir"
    mkdir -p $opt_dir
fi

arch_name=code.tar.gz
code_link=$(curl -D - https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-x64 | grep "location" | awk '{printf $2}' | tr -d '\r')

wget -O $arch_name $code_link

tar xvf $arch_name -C $opt_dir

if [ ! -e $local_bin/code ]; then
    echo "Create link in $local_bin"
    ln -s $opt_dir/VSCode-linux-x64/bin/code $local_bin/code 
fi

rm $arch_name

alias=$(cat ~/.zshrc | grep "alias code.*")
if [ -z "$alias" ]; then
    echo "alias code='code --ozone-platform-hint=auto'" >> ~/.zshrc
fi

if [ ! -d /tmp/Packs ]; then
    echo "Clone repo"
    git clone https://github.com/neyakki/Packs.git /tmp/Packs
else
    echo "Update repo"
    cd /tmp/Packs && git fetch
fi

find /tmp/Packs/vsix -iname "*.vsix" -exec code --install-extension {} \;

