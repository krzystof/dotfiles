#!/bin/bash

if [ ! -d "/usr/share/icons/Arc" ] ; then
    e_arrow "Getting Arc icons"
    git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
    sudo mv Arc /usr/share/icons
    rm -rf arc-icon-theme
    e_success "arc icons installed"
else
    echo "Arc icons present"
fi
