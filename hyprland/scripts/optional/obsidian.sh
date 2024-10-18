#!/bin/bash

opt_dir=~/opt
local_bin=~/.local/bin

wget -O obsidian https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage 
chmod +x obsidian

mv obsidian $opt_dir/obsidian

if [ ! -e $local_bin/obsidian ]; then
    echo "Create link in $local_bin"
    ln -s $opt_dir/obsidian $local_bin/obsidian 
fi


alias=$(cat ~/.zshrc | grep "alias obsidian.*")
if [ -z "$alias" ]; then
    echo "alias obsidian='obsidian --ozone-platform-hint=auto'" >> ~/.zshrc
fi

