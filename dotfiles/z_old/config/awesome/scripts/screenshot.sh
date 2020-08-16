#!/bin/bash

#This script is useb by awesomewm
#This script manages what type of screenshot is going to be taken

arg=$1
dt=$(date +%Y%m%d-%H_%M_%S)

#-w window, -s selection, -ss save selection, -f fullscreen, -fc fullscreen clipboard


if [ ! -d "$HOME/Pictures/Screenshots" ]; then
  mkdir -p $HOME/Pictures/Screenshots;
fi


if [ "$arg" == "-f" ]; then
	maim ~/Pictures/Screenshots/Screenshot$dt.png
elif [ "$arg" == "-s" ]; then
 	maim -s -o | xclip -selection clipboard -t image/png
elif [ "$arg" == "-ss" ]; then
	maim -s -o ~/Pictures/Screenshots/Selection$dt.png
elif [ "$arg" == "-w" ]; then
	maim -i $(xdotool getactivewindow) ~/Pictures/Screenshots/ActiveWindow$dt.png
elif [ "$arg" == "-fc" ]; then
 	maim | xclip -selection clipboard -t image/png
fi
