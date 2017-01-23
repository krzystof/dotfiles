#!/bin/sh
set -e

if [ -f ~/.fonts/SourceCodePro-Regular.ttf ] ; then
    exit 0
fi

if [ ! -d ~/.fonts ] ; then
    mkdir ~/.fonts
fi

cd ~/Downloads
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.tar.gz
tar -zxvf 1.050R-it.tar.gz
mv source-code-pro-2.030R-ro-1.050R-it/TTF/* ~/.fonts/
