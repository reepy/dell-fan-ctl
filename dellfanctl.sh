#!/usr/local/bin/zsh

source settings.sh
source functions.sh

## get fanspeed and temperature into variables and print them

FANSPEED=$(get-fanspeed)

echo "Info: Fan speed is ${FANSPEED}"

TEMPERATURE=$(get-temperature)

echo "Info: Temperature is ${TEMPERATURE}"

## if too hot, then go to auto, else, set it manually based on the range

if [ ${TEMPERATURE} -gt ${MAXTEMP} ]
  then
    echo "TOO HOT! Set back to auto."
    ctrl "disable"
  else
    echo "Info: Temperature within range, setting new fan speed."

    echo "Info: Enabling manual control."
    ctrl "enable"

    NEWFANSPEED=$(calc-fanspeed ${TEMPERATURE})
    echo "Action: New fan speed: ${NEWFANSPEED}"
    set-fanspeed ${NEWFANSPEED}

    echo "Action: Checking new fan speed."
    sleep 3
    POSTFANSPEED=$(get-fanspeed)
    echo "Info: New fan speed ${POSTFANSPEED}."
fi