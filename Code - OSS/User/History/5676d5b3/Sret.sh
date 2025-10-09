#!/bin/bash

# Power Menu Script for Polybar

case "$1" in
    shutdown)
        systemctl poweroff
        ;;
    reboot)
        systemctl reboot
        ;;
    suspend)
        systemctl suspend
        ;;
    logout)
        # Replace with your window manager's logout command
        # For example, for i3:
        i3-msg exit
        ;;
    *)
        echo "Usage: $0 {shutdown|reboot|suspend|logout}"
        exit 1
        ;;
esac