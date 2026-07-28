#!/bin/bash

THEMES_DIR="$HOME/.config/themes"
CURRENT="$THEMES_DIR/current"
WAYBAR_STATE="$HOME/.config/waybar/current"
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

choice=$(printf "Dark\nCatppuccin\nNord" | rofi \
    -dmenu \
    -i \
    -p "Theme")

case "$choice" in
    "Dark")
        ln -sfn bnw "$CURRENT"

        WALLPAPERS=(
            "$WALLPAPERS_DIR/illdian.jpg"
            "$WALLPAPERS_DIR/illdian2.jpg"
            "$WALLPAPERS_DIR/reze.jpg"
        )

        killall swaync
        notify-send "Dark theme"
        ;;

    "Catppuccin")
        ln -sfn catppuccin "$CURRENT"

        WALLPAPERS=(
            "$WALLPAPERS_DIR/catppuccin1.png"
            "$WALLPAPERS_DIR/catppuccin2.png"
            "$WALLPAPERS_DIR/catppuccin3.png"
            "$WALLPAPERS_DIR/catppuccin4.png"
            "$WALLPAPERS_DIR/catppuccin5.png"
            "$WALLPAPERS_DIR/catppuccin6.png"
        )

        killall swaync
        notify-send "Catppuccin Theme"
        ;;

    "Nord")
        ln -sfn nord "$CURRENT"

        WALLPAPERS=(
            "$WALLPAPERS_DIR/nord.png"
            "$WALLPAPERS_DIR/nord2.png"
            "$WALLPAPERS_DIR/nord3.png"
            "$WALLPAPERS_DIR/nord4.png"
            "$WALLPAPERS_DIR/nord5.png"
            "$WALLPAPERS_DIR/nord6.png"
        )

        killall swaync
        notify-send "Nord theme"
        ;;

    *)
        exit 0
        ;;
esac


# Elegir wallpaper aleatorio
WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"


# Aplicar wallpaper
awww img "$WALLPAPER" \
    --transition-type wipe \
    --transition-duration 1


# Reiniciar Waybar
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
        echo "dock" > "$WAYBAR_STATE"

        setsid waybar \
            -c "$HOME/.config/waybar/config.jsonc" \
            -s "$HOME/.config/waybar/style.css" \
            >/dev/null 2>&1 &
        ;;
esac