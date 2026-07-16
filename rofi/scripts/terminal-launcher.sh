#!/bin/bash

cmd=$(rofi -dmenu \
    -theme ~/.config/rofi/theme.rasi \
    -theme-str '
        
        window {
            width: 450px;
            height: 93px;
        }
    ' \
    -p "Prompt")

[ -z "$cmd" ] && exit

kitty -e bash -c "$cmd"