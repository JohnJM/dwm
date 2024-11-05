#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city
dwm_weather() {
    LOCATION=edinburgh

    DATA=$(curl -s wttr.in/$LOCATION?format=1 | sed 's/[[:space:]]*$//') # Remove trailing whitespace

    DATA=$(echo "$DATA" | sed 's/^\(.\)\(..\)\(..\)\(..\)/\1\4/')
    DATA=$(echo "$DATA" | sed 's/^\(.\)\(.*\)/\2 \1/')

    export __DWM_BAR_WEATHER__=" | ${DATA}" 
}

dwm_weather
