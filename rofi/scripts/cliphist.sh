#!/bin/bash

selection=$(cliphist list | rofi -dmenu -i -p "Clipboard")

[ -z "$selection" ] && exit

cliphist decode <<< "$selection" | wl-copy