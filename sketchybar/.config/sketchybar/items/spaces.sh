#!/bin/bash

#### Adding Mission Control Space Indicators ####
# Now we add some mission control spaces:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item
# to indicate active and available mission control spaces

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for i in "${!SPACE_ICONS[@]}"; do
    sid=$(($i + 1))
    sketchybar --add space space.$sid left \
        --set space.$sid associated_space=$sid \
        icon=${SPACE_ICONS[i]} \
        icon.font="$FONT:Bold:17.0" \
        icon.padding_left=8 \
        icon.padding_right=8 \
        background.color=0xff7c6f64 \
        background.corner_radius=5 \
        background.height=22 \
        background.y_offset=-1 \
        label.font="$FONT:Regular:16" \
        script="$PLUGIN_DIR/space.sh" \
        click_script="yabai -m space --focus $sid" \
        --subscribe space.$sid front_app_switched
done
