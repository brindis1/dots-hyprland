#!/bin/bash

CONFIG="$HOME/.config"

# Crear symlink del tema actual
ln -sfn bnw "$CONFIG/themes/current"

# Crear symlink de colores de Rofi
ln -sfn "$CONFIG/themes/current/colors.rasi" \
    "$CONFIG/rofi/colors.rasi"

# Crear symlink de colores de Waybar
ln -sfn "$CONFIG/themes/current/colors.css" \
    "$CONFIG/waybar/colors.css"

# Dar permisos de ejecución a todos los scripts
find "$CONFIG" -type f -name "*.sh" -exec chmod +x {} \;

echo "Symlinks creados y permisos aplicados."
