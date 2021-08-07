#!/usr/local/bin/zsh

source settings.sh
source functions.sh

## get fanspeed and temperature into variables and print them

get-fanspeed
#FANSPEED=$(get-fanspeed)

get-temperature
#TEMPERATURE=$(get-temperature)

## if too hot, then go to auto, else, set it manually based on the range

# if [ TEMPERATURE -gt MAXTEMP ]
#  then
#    echo "TOO HOT! Set back to auto."
#    ctrl "disable"
# else
#    ctrl "enable"

## work out what speed it should be based on the temperature

#    set-fanspeed $SPEED
#    FANSPEEDNEW=$(get-fanspeed)
#    echo "Temperature within range. New speed ${FANSPEEDNEW}%."

# fi