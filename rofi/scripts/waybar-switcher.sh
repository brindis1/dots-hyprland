#!/bin/sh

WAYBAR_STATE="$HOME/.config/waybar/current"

choice=$(
printf "Dock\nFull Bar" | rofi \
    -dmenu \
    -i \
    -p "Settings" \
    -theme "$HOME/.config/rofi/theme.rasi" \
    -theme-str '
        window {
            width: 380px;
            height: 225px;
        }

        listview {
            lines: 2;
        }
    '
)

case "$choice" in
    'Dock')
        echo "dock" > "$WAYBAR_STATE"

        pkill -x waybar
        setsid waybar \
            -c "$HOME/.config/waybar/config.jsonc" \
            -s "$HOME/.config/waybar/style.css" \
            >/dev/null 2>&1 &
        ;;

    'Full Bar')
        echo "full" > "$WAYBAR_STATE"

        pkill -x waybar
        setsid waybar \
            -c "$HOME/.config/waybar/full/config-full.jsonc" \
            -s "$HOME/.config/waybar/full/style-full.css" \
            >/dev/null 2>&1 &
        ;;
esac