#1/bin/bash
killall -q compton

while pgrep -u $UID -x compton > /dev/null; do sleep 1; done

compton --config ~/.config/compton/compton.conf &
