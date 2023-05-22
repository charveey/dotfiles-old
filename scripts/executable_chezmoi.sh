#!/bin/bash

if [ -x "$(command -v pacman)" ];	then chezmoi init --apply git@github.com:charveey/dotfiles.git 
else sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply charveey 
