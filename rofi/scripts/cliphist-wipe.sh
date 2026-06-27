#!/bin/bash

choice=$(
printf "󰆴 No\n󰆳 Sí, borrar todo" | rofi \
    -dmenu \
    -i \
    -p "Limpiar historial" \
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

[[ "$choice" != "󰆳 Sí, borrar todo" ]] && exit

cliphist wipe

notify-send "Clipboard" "Historial eliminado"