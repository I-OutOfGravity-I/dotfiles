#! /bin/bash


while true; do
    if   [[ $(pacmd list-sink-inputs | grep "state: RUNNING") ]];
    then
		echo "running"
        for pid in $(pidof -x "cava.sh"); do
            if [ $pid != $$ ]; then
                echo "nice"
            else
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
    sleep 1
done
