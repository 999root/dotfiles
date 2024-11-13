#!/usr/bin/env sh

# Check if Mullvad VPN is connected
LABEL="$(mullvad status | grep "Connected" > /dev/null && echo "Mullvad VPN: Connected" || echo "Mullvad VPN: Disconnected")"

# Update sketchybar with Mullvad VPN status
sketchybar --set Mullvad label="$LABEL"
