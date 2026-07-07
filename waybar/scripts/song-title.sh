#!/bin/bash

# Ocultar todo si Spotify no existe
playerctl -p spotify status &>/dev/null || exit 1

playerctl -p spotify metadata xesam:title