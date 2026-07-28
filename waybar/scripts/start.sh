#!/bin/bash

WAYBAR_STATE="$HOME/.config/waybar/current"

case "$(cat "$WAYBAR_STATE" 2>/dev/null)" in
"dock")
  waybar \
    -c "$HOME/.config/waybar/config.jsonc" \
    -s "$HOME/.config/waybar/style.css"
  ;;

"full")
  waybar \
    -c "$HOME/.config/waybar/full/config-full.jsonc" \
    -s "$HOME/.config/waybar/full/style-full.css"
  ;;

*)
  echo "dock" >"$WAYBAR_STATE"

  waybar \
    -c "$HOME/.config/waybar/config.jsonc" \
    -s "$HOME/.config/waybar/style.css"
  ;;
esac
