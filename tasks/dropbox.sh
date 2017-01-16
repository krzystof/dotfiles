#!/bin/sh
set -e
# . ./colors_and_utils.sh

if ! command -v dropbox > /dev/null; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
fi
