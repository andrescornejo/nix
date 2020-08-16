#!/bin/bash

#This script is used by ~/.xprofile
#The purpose of this script is to set the acceleration and sensitivity of the mouse.
#In this case the mouse being used is a 'Corsair Dark Core RGB SE', to set a different mouse use the 'xinput list' command and look for the desired mouse.


current_mouse=Corsair\ CORSAIR\ DARK\ CORE\ RGB\ SE\ Wireless\ USB\ Receiver\ Mouse

Mouse=`xinput list |grep -i "$current_mouse" | awk -F= '{ print $2}'| awk '{print $1}'| awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1}'
`

xinput set-prop $Mouse "libinput Middle Emulation Enabled" 1
xinput set-prop $Mouse "libinput Scroll Method Enabled" 0, 0, 1
xinput set-prop $Mouse "libinput Accel Speed" .0
xinput set-prop $Mouse "Coordinate Transformation Matrix" .6 0 0 0 .6 0 0 0 2.5
