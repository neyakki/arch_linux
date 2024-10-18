#!/bin/bash

opt_dir=~/opt
local_bin=~/.local/bin

if [ ! -d $opt_dir ]; then
    echo "Create opt dir"
    mkdir -p $opt_dir
fi

wget -O $opt_dir/nekoray https://github.com/MatsuriDayo/nekoray/releases/download/4.0-beta3/nekoray-4.0-beta3-2024-07-13-linux-x64.AppImage

chmod +x $opt_dir/nekoray

if [ ! -e $local_bin/nekoray ]; then
    echo "Create link in $local_bin"
    ln -s $opt_dir/nekoray $local_bin/nekoray 
fi

#alias=$(cat ~/.zshrc | grep "alias nekoray.*")
#if [ -z "$alias" ]; then
#    echo "alias nekoray='nekoray --ozone-platform-hint=auto'" >> ~/.zshrc
#fi

