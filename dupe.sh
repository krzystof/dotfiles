#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $DOTFILES_DIR
git pull
