#!/bin/bash

case $@ in
"FaceTime")
	icon_result=":face_time:"
	;;
"Code")
	icon_result="􀡅"
	;;
"Arc")
	icon_result="􀆪"
	;;
"Discord")
	icon_result="􀌨"
	;;
"Front")
	icon_result="􀍕"
	;;
"kitty")
	icon_result="􀩼"
	;;
"Fantastical")
	icon_result="􀉉"
	;;
"iTerm2")
	icon_result="􀪏"
	;;
"MongoDB Compass")
	icon_result="􀪬"
	;;
"Spotify")
	icon_result="􀑪"
	;;
"Insomnia")
	icon_result="􀥦"
	;;
"SF Symbols")
	icon_result="􁣃"
	;;
*)
	icon_result="􀿨"
	;;
esac
echo $icon_result
