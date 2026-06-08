#!/bin/bash
# Get the external monitor (not eDP-1)
hyprctl monitors | awk '/^Monitor / {monitor=$2} /^Monitor eDP-1/ {next} END {print monitor}'