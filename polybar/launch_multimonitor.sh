#!/bin/bash
(
    flock 200

    killall -q polybar

    while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

    outputs=$(polybar --list-monitors | cut -d":" -f1)
    tray_output=eDP-1-1

    for m in $outputs; do
        if [[ $m == "DP-0.3" || $m == "DP-2" ]]; then
            tray_output=$m
        fi
    done

    for m in $outputs; do
        export MONITOR=$m
        export TRAY_POSITION=none
        if [[ $m == $tray_output ]]; then
            TRAY_POSITION=right
            polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
            disown
        else
            polybar --reload secondary </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
            disown
        fi
    done
) 200>/var/tmp/polybar-launch.lock
