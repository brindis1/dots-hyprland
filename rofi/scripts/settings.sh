#!/bin/bash

choice=$(
printf "Change Wallpaper\nSwitch Waybar style\nChange Theme"| rofi \
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
    "Change Wallpaper")
        exec ~/.config/rofi/scripts/wallpaper.sh
        ;;

    "Switch Waybar style")
        exec ~/.config/rofi/scripts/waybar-switcher.sh
        ;;
    "Change Theme")
        exec ~/.config/themes/apply-theme.sh
        ;;
    *)
        exit 0
        ;;
esac