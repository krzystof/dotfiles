#!/bin/sh
set -e

if ! command -v nvm > /dev/null ; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
fi
