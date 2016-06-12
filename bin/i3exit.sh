#!/bin/sh
lock() {
    i3lock
}

case "$1" in
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0