#!/bin/bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

if [[ $SELECTED == "true" ]]; then
    sketchybar --set $NAME background.color=0xff928374
else
    sketchybar --set $NAME background.color=0xff504945
fi

if [[ $SENDER == "front_app_switched" ]]; then

    SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

    for i in "${!SPACES[@]}"; do
        sid=$(($i + 1))
        arr=()
        icons=""

        QUERY=$(yabai -m query --windows --space $sid | jq '.[].app')

        if grep -q "\"" <<<$QUERY; then

            while IFS= read -r line; do arr+=("$line"); done <<<"$QUERY"

            for i in "${!arr[@]}"; do
                icon=$(echo ${arr[i]} | sed 's/"//g')
                echo $icon
                icon=$($HOME/.config/sketchybar/plugins/app_icons.sh $icon)
                icons+="$icon  "
            done

        fi
        echo $icons

        if [[ $icons == "" ]]; then
            sketchybar --set space.$sid label.drawing=no \
                label.padding_right=0
        else
            sketchybar --set space.$sid label.drawing=yes \
                label="$icons" \
                label.padding_right=8
        fi
    done
fi
