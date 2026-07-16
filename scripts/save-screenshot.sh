#!/bin/bash

DEST="$HOME/Pictures/Screenshots"
mkdir -p "$DEST"

FILE="$DEST/screenshot-$(date +%F_%H-%M-%S).png"

cp /tmp/last-screenshot.png "$FILE"

notify-send \
  -a "Screenshot" \
  -i "$FILE" \
  "Captura guardada" \
  "$(basename "$FILE")"
