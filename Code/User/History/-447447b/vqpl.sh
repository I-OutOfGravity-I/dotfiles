#! /bin/bash


while true; do
    if   [[ $(pacmd list-sink-inputs | grep "state: RUNNING") ]];
    then
        for pid in $(pidof -x "cava.sh"); do
            if [ $pid != $$ ]; then
                echo "running"
            else
			echo "start"
                $HOME/.config/polybar/cava.sh &
            fi
        done
    else
        echo "killing"
        for pid in $(pidof -x "cava.sh"); do
            if [ $pid != $$ ]; then
                kill -9 $pid
            fi
        done
    fi
    sleep 2
done
