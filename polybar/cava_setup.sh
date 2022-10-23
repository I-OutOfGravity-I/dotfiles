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
	    echo""
        pkill "cava.sh"
		pkill "cava"
    fi
    sleep 1
done
