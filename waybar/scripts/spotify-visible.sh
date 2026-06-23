#!/bin/bash

# Ocultar todo si Spotify no existe
playerctl -p spotify status &>/dev/null || exit 1

case "$1" in
    prev)
        echo "󰒮"
        ;;
    play)
        if [[ "$(playerctl -p spotify status)" == "Playing" ]]; then
            echo "󰏤"
        else
            echo "󰐊"
        fi
        ;;
    next)
        echo "󰒭"
        ;;
esac