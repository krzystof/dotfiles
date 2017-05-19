#!/bin/bash

if [ ! -d "/usr/share/icons/Arc" ] ; then
    e_warning "Getting Arc icons"
    git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme > /dev/null 2>&1
    sudo mv Arc /usr/share/icons
    rm -rf arc-icon-theme
    e_success "arc icons installed"
else
    e_ok "Arc icons present"
fi

if [ ! -d "/usr/share/icons/Moka" ] ; then
    e_warning "Getting Moka icons"
    sudo add-apt-repository -y ppa:moka/daily > /dev/null 2>&1
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get -y install moka-icon-theme > /dev/null 2>&1
    e_success "Moka icons installed"
else
    e_ok "Moka icons present"
fi
