#! /bin/bash
isrunning=false

while true; do
    if   [[ $(pacmd list-sink-inputs | grep "state: RUNNING") ]];
    then
        for pid in $(pidof -x "cava.sh"); do
            if [ $pid != $$ ]; then
                echo "cava is running"
                isrunning=true
            fi
        done
        if [ "$isrunning" = false ] ; then
            echo "starten cava"
            $HOME/.config/polybar/cava.sh &
        fi
    else
        sleep 2
        if !  [[ $(pacmd list-sink-inputs | grep "state: RUNNING") ]];
        then
            echo "KILLING cava"
            echo""
            pkill "cava.sh"
            pkill "cava"
        fi
    fi
done
