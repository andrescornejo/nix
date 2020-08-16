#!/bin/bash

#This script is used by awesomewm
#This script will will control the current pulseaudio sink, it can raise, lower and toggle mute the volume level.

action=$1
sink=$(pactl list short sinks | grep RUNNING | cut -f1)

if [ "$action" == "up" ]; then
	pactl set-sink-volume $sink +2%
elif [ "$action" == "down" ]; then
	pactl set-sink-volume $sink -2%
elif [ "$action" == "mute" ]; then
	pactl set-sink-mute $sink toggle
else
	printf "Invalid input.\n"
fi
