#!/bin/bash
MULLVAD=(
  update_freq=10
  icon=$WIFI_CONN_ICON
  icon.color=$WHITE
  background.color=$BG_SEC_COLR
  script="$PLUGIN_DIR/mullvad.sh"
)

sketchybar --add item mullvad right   \
           --set mullvad "${MULLVAD[@]}" \
           --subscribe Mullvad mullvad_change