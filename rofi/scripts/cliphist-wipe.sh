#!/bin/bash

choice=$(printf "󰆴 No\n󰆳 Sí, borrar todo" | rofi -dmenu -i -p "Limpiar historial")

[[ "$choice" != "󰆳 Sí, borrar todo" ]] && exit

cliphist wipe

notify-send "Clipboard" "Historial eliminado"