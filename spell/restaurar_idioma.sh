#!/bin/bash
previous_layout=$(cat /tmp/keyboard_layout)
setxkbmap $previous_layout
