#! /bin/bash
isrunning=false


while true; do
    if   [[ $(pacmd list-sink-inputs | grep "state: RUNNING") ]];
    then
        for pid in $(pidof -x "cava.sh"); do
            if [ $pid != $$ ]; then
                isrunning=true
            fi
        done
        if [ "$isrunning" = false ] ; then
            $HOME/.config/polybar/cava.sh &
        fi
    else
        for pid in $(pidof -x "cava.sh" "cava -p /tmp/polybar_cava_config"); do
            if [ $pid != $$ ]; then
                kill -9 $pid
            fi
        done
    fi
    sleep 1
done
