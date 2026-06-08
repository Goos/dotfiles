#!/bin/bash

STATE_FILE="/proc/acpi/button/lid/LID/state"
LAST_STATE=$(cat "$STATE_FILE" | awk '{print $2}')

while true; do
    CURRENT_STATE=$(cat "$STATE_FILE" | awk '{print $2}')
    
    if [ "$CURRENT_STATE" != "$LAST_STATE" ]; then
        if [ "$CURRENT_STATE" = "closed" ]; then
            /home/goos/.config/hypr/scripts/lid-switch.sh close
        else
            /home/goos/.config/hypr/scripts/lid-switch.sh open
        fi
        LAST_STATE="$CURRENT_STATE"
    fi
    sleep 1
done
