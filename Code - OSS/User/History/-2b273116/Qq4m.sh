#!/bin/bash

# Configuration
BAT_PATH="/sys/class/power_supply/BAT0"
LOW_LEVEL=15
CRITICAL_LEVEL=8
LOCKFILE="/tmp/.battery_alert.lock"

# Read current battery level and status
LEVEL=$(cat "$BAT_PATH/capacity")
STATUS=$(cat "$BAT_PATH/status")

# Avoid showing alert if charging
if [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
    rm -f "$LOCKFILE" 2>/dev/null
    exit 0
fi

# Check thresholds
if [[ "$LEVEL" -le "$CRITICAL_LEVEL" ]]; then
    MSG="⚠️ CRITICAL BATTERY: ${LEVEL}%"
elif [[ "$LEVEL" -le "$LOW_LEVEL" ]]; then
    MSG="🔋 Battery low: ${LEVEL}%"
else
    rm -f "$LOCKFILE" 2>/dev/null
    exit 0
fi

# Prevent repeated alerts
if [[ -f "$LOCKFILE" ]]; then
    exit 0
fi

# Show alert using rofi
echo -e "$MSG\nPlug in your charger." | rofi -e "$MSG"

# Create lockfile to prevent spamming
touch "$LOCKFILE"
