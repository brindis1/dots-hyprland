#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"

# Ensure awww daemon is running
if ! pidof awww-daemon >/dev/null; then
    awww-daemon &
    sleep 0.5
fi

GRID_THEME='
@import "../colors.rasi"

* {
  font: "Inter Medium 13";
}

window {
  width: 800px;
  height: 350px;
  background-color: @bg0;
  border: 2px;
  border-color: @sec;
  border-radius: 20px 20px 0px 0px;
  padding: 18px;
  location: south;
}

mainbox {
  spacing: 14px;
  children: [ inputbar, listview ];
}

inputbar {
  background-color: @bg0;
  border: 1px;
  border-color: @sec;
  border-radius: 14px;
  padding: 12px 16px;
  spacing: 10px;
  children: [ prompt, entry ];
}

prompt {
  text-color: @text;
}

entry {
  text-color: @text;
  placeholder: "Search wallpapers...";
  placeholder-color: #cfdbd5;
}

listview {
  columns: 4;
  lines: 3;
  flow: horizontal;
  fixed-height: true;
  fixed-columns: true;
  spacing: 10px;
  scrollbar: false;
}

element {
  orientation: vertical;
  children: [ element-icon, element-text ];
  padding: 0px;
  spacing: 10px;
  border-radius: 14px;
  background-color: @bg0;
}

element selected.normal {
  background-color: @sec;
}

element-icon {
  size: 180px;
  expand: true;
  horizontal-align: 0.5;
  vertical-align: 0.5;
}

element-text {
  font: "Inter Medium 10";
  text-color: @text;
  horizontal-align: 0.5;
  vertical-align: 0.5;
  expand: false;
}
'


SELECTED=$(
for img in "$WALL_DIR"/*; do
    [[ "$img" =~ \.(jpg|jpeg|png|webp|PNG|JPG)$ ]] || continue
    printf "%s\0icon\x1f%s\n" "$(basename "$img")" "$img"
done | rofi \
-dmenu \
-i \
-show-icons \
-theme-str "$GRID_THEME" \
-p "" \
-name "wallpaper-picker"

)

if [ -n "$SELECTED" ]; then
    awww img "$WALL_DIR/$SELECTED" \
        --transition-type wipe \
        --transition-duration 1
fi
