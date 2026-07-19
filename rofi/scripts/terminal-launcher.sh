#!/bin/bash

cmd=$(rofi -dmenu \
    -theme ~/.config/rofi/theme.rasi \
    -theme-str '
        
        window {
            width: 550px;
            height: 93px;
        }

        entry {
          placeholder: "Input...";

        }
        
    ' \
    -p "")

[ -z "$cmd" ] && exit

kitty -e bash -c "$cmd"