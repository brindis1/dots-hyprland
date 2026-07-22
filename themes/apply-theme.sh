#!/bin/bash

THEMES_DIR="$HOME/.config/themes"
CURRENT="$THEMES_DIR/current"
WAYBAR_STATE="$HOME/.config/waybar/current"

choice=$(printf "Black & White\nCatppuccin\nNord" | rofi \
    -dmenu \
    -i \
    -p "Theme")

case "$choice" in
    "Black & White")
        ln -sfn bnw "$CURRENT"
        killall swaync
        notify-send "Black & White Theme"
        ;;

    "Catppuccin")
        ln -sfn catppuccin "$CURRENT"
        killall swaync
        notify-send "Catpuccin Theme"

        ;;

    "Nord")
        ln -sfn nord "$CURRENT"
        killall swaync
        notify-send "Nord Theme"
        ;;
    *)
        exit 0
        ;;
esac

pkill -x waybar

case "$(cat "$WAYBAR_STATE" 2>/dev/null)" in
    "dock")
        setsid waybar \
            -c "$HOME/.config/waybar/config.jsonc" \
            -s "$HOME/.config/waybar/style.css" \
            >/dev/null 2>&1 &
        ;;

    "full")
        setsid waybar \
            -c "$HOME/.config/waybar/full/config-full.jsonc" \
            -s "$HOME/.config/waybar/full/style-full.css" \
            >/dev/null 2>&1 &
        ;;

    *)
        # Si no existe el estado, usar Dock por defecto
        echo "dock" > "$WAYBAR_STATE"

        setsid waybar \
            -c "$HOME/.config/waybar/config.jsonc" \
            -s "$HOME/.config/waybar/style.css" \
            >/dev/null 2>&1 &
        ;;
esac