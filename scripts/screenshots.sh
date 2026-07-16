#!/bin/bash

TMP="/tmp/screenshot-$(date +%s).png"

# Seleccionar región
geometry=$(slurp) || exit

# Captura
grim -g "$geometry" "$TMP"

# Copiar al portapapeles
wl-copy <"$TMP"

# Enviar notificación
notify-send \
  -a "Screenshot" \
  -i "$TMP" \
  "Captura copiada"
