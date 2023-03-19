#!/usr/bin/env bash

killall -q picom

# Launch picom
echo "---" | /tmp/picom.log
picom --config=$HOME/.config/picom/picom.conf 2>&1 | tee -a /tmp/picom.log & disown
echo "Picom launched..."


