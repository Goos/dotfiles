#!/bin/bash
# Read AGENTS.md globally and inject it as an ephemeral message
PROMPT=$(cat /home/goos/.config/ai-agents/AGENTS.md 2>/dev/null || true)
if [ -n "$PROMPT" ]; then
  jq -n --arg p "[GLOBAL AGENT RULES]

$PROMPT" '{"injectSteps": [{"ephemeralMessage": $p}]}'
else
  echo "{}"
fi
