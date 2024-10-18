#!/bin/bash

pacman -S --noconfirm docker docker-compose docker-buildx

usermod -aG docker $USER
