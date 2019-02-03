#!/bin/bash

tmux send -t minecraft "stop"
tmux send -t minecraft "Enter"
loop=60
while [ $loop -gt 0 ]; do
    # Loop again unless the tmux window is closed
    tmux list-window -F '#{window_name}' -t ${TMUX_SESSION} 2>&1 | grep -q ^${TMUX_WINDOW}$
    if [ $? = 0 ] ; then
        loop=$((loop - 1))
        sleep 1
        continue
    fi
    break
done
