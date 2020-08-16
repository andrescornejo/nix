#!/bin/bash

#This script is useb by awesomewm
#This script manages what type of screenshot is going to be taken

arg=$1
dt=$(date +%Y%m%d-%H_%M_%S)

#-w window, -s selection, -ss save selection, -f fullscreen, -fc fullscreen clipboard


if [ ! -d "$HOME/Pictures/screenshots" ]; then
  mkdir -p $HOME/Pictures/screenshots;
fi


if [ "$arg" == "-f" ]; then
	maim ~/Pictures/screenshots/Screenshot$dt.png
	notify-send 'Screenshot Taken' 'Saved in: ~/Pictures/screenshots' -u low
elif [ "$arg" == "-s" ]; then
 	maim -s -o | xclip -selection clipboard -t image/png
	notify-send 'Selection copied to clipboard' -u low
elif [ "$arg" == "-ss" ]; then
	maim -s -o ~/Pictures/screenshots/Selection$dt.png
elif [ "$arg" == "-w" ]; then
	maim -i $(xdotool getactivewindow) ~/Pictures/screenshots/ActiveWindow$dt.png
elif [ "$arg" == "-fc" ]; then
 	maim | xclip -selection clipboard -t image/png
	notify-send 'Screen copied to clipboard' -u low
fi
