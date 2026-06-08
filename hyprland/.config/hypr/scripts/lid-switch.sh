#!/bin/bash
LID_STATE=$1
LAPTOP_MONITOR="eDP-1"
LOG_FILE="/tmp/hypr-lid.log"

echo "$(date) - Lid $LID_STATE" >> "$LOG_FILE"

HYPRCTL="/usr/bin/hyprctl"

if [ "$LID_STATE" = "close" ]; then
    EXTERNAL_MONITOR=$($HYPRCTL monitors -j | jq -r ".[] | select(.name != \"$LAPTOP_MONITOR\") | .name" | head -1)
    echo "Detected External Monitor: $EXTERNAL_MONITOR" >> "$LOG_FILE"
    
    if [ -n "$EXTERNAL_MONITOR" ]; then
        # Use the Lua API to move workspaces and disable the monitor
        # This bypasses the legacy parser issues in v0.55.2
        $HYPRCTL eval "
            local ext = '$EXTERNAL_MONITOR'
            local laptop = '$LAPTOP_MONITOR'
            local workspaces = hl.get_workspaces()
            for _, ws in ipairs(workspaces) do
                if ws.monitor.name == laptop then
                    hl.dispatch(hl.dsp.workspace.move({ workspace = ws.id, monitor = ext }))
                end
            end
            hl.monitor({ output = laptop, mode = 'disable' })
            hl.dispatch(hl.dsp.focus({ monitor = ext }))
        "
    else
        echo "No external monitor found. Not disabling internal." >> "$LOG_FILE"
    fi
elif [ "$LID_STATE" = "open" ]; then
    echo "Enabling $LAPTOP_MONITOR" >> "$LOG_FILE"
    $HYPRCTL eval "hl.monitor({ output = '$LAPTOP_MONITOR', mode = 'preferred', position = 'auto', scale = '1' })"
fi
