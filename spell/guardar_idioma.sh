#!/bin/bash
# Aquí necesitas guardar el estado anterior de idioma antes de cambiarlo
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')
echo $current_layout > /tmp/keyboard_layout

