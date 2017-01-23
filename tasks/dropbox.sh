#!/bin/sh
set -e
# . ./utils.sh

if ! command -v dropbox > /dev/null; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
fi

# check if dropbox was sync...
