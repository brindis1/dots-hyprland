#!/bin/bash

choice=$(
printf "Wallpaper\nWaybar\nTheme"| rofi \
    -dmenu \
    -i \
    -p "Settings" \
    -theme ~/.config/rofi/theme.rasi \
    -theme-str '
        window {
            width: 380px;
            height: 325px;
        }

        listview {
            lines: 2;
        }
    '
)

case "$choice" in
    "Wallpaper")
        exec ~/.config/rofi/scripts/wallpaper.sh
        ;;

    "Waybar")
        exec ~/.config/rofi/scripts/waybar-switcher.sh
        ;;
    "Theme")
        exec ~/.config/themes/apply-theme.sh
        ;;
    *)
        exit 0
        ;;
esac