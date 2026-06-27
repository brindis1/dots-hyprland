#!/bin/bash

choice=$(
printf "󰆴 No\n󰆳 Yes" | rofi \
    -dmenu \
    -i \
    -p "Clean cliphist" \
    -theme ~/.config/rofi/theme.rasi \
    -theme-str '
        window {
            width: 380px;
            height: 200px;
        }

        listview {
            lines: 2;
        }
    '
)

[[ "$choice" != "󰆳 Yes" ]] && exit

cliphist wipe
