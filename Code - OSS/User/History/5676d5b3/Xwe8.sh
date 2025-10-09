#!/bin/bash

#!/usr/bin/env bash

if [ -z "$@" ]; then
    echo "Lock"
    echo "Logout"
    echo "Reboot"
    echo "Shutdown"
else
    case "$@" in
        Lock) i3lock -c 000000 ;;
        Logout) i3-msg exit ;;
        Reboot) systemctl reboot ;;
        Shutdown) systemctl poweroff ;;
    esac
fi
