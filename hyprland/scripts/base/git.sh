#!/bin/bash

pacman -S --noconfirm git

git config --global user.name "neyakki"
git config --global user.email "neyakki@gmail.com"
git config --global init.defaultBranch master
git config --global core.editor vim
git config --global core.autocrlf input
git config --global color.ui true
git config --global alias.hist 'log --pretty=format:"%C(cyan)%h%Creset %C(red)%an%Creset %ad %ar - %C(magenta)%s%Creset %d" --graph --abbrev-commit --date=format:"%d-%m-%Y"'


