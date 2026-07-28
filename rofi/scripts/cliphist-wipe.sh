#!/bin/bash

choice=$(
printf "󰆳 Yes\n󰆴 No" | rofi \
    -dmenu \
    -i \
    -p "Clean cliphist" \
    -theme ~/.config/rofi/theme.rasi \
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

[[ "$choice" != "󰆳 Yes" ]] && exit

cliphist wipe

notify-send "Clipboard" "Deleted Clipboard"