#!/bin/sh

CLEAR_LINE='\r\033[K'

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'
CLEAR_LINE='\r\033[K'

msg_info() {
    printf "⏳   $1"
}

msg_success() {
    printf "${CLEAR_LINE}[6/6]${GREEN}✔   $1 ${NO_COLOR}\n"
}
