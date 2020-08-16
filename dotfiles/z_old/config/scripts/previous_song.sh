#!/bin/bash

#This script is used by awesomewm

#This script will restart the current song in playback, if it already has more than 3 seconds of play time. Otherwise, it will go to the previous song in the current playlist.

pos=$(playerctl position)
pos_as_int=$(echo $pos/1 | bc)

if [ "$pos_as_int" -ge 5 ]; then
	playerctl position 0
else
	playerctl previous
fi
