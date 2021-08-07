#!/usr/local/bin/zsh

function ipmi {
  # param: ipmi string

  echo ipmitool -I lanplus -H IMPIHOST -U IMPIUSER -P IMPIPASS ${1}

}

function ctrl {
  # param: enable, disable

  if [ ${1} = "enable" ]
    then
      VALUE=0x00
    else
      VALUE=0x01
  fi

  ipmi "raw 0x30 0x30 0x01 $VALUE"

}

function get-temperature {
  ipmi "sdr type Temperature"
  # @todo get just the temperature as a string
}

function get-fanspeed {
  ipmi "sensor get ${FAN}"
  # @todo get just the speed as a string
}

function set-fanspeed {
  # param: % (which will be converted to hex)

  ipmi "raw 0x30 0x30 0x02 0xff $(([##16]${1}))"

  # @todo work out whether this was successful or not

}

function calc-isnumber {
  case ${1#[-+]} in
    ''|.|*[!0-9.]*|*.*.*) return 1;
    ;
  esac
}

function calc-fanspeed {
  # param: current temp

  CURRTEMP = ${1}

  NEWSPEED = ${MAXSPEED} - ( ${MINSPEED} / ( ${MINTEMP} / ( ${CURRTEMP} - ${MINTEMP} ) ) )

  ISNUMBER=$(calc-isnumber ${NEWSPEED})

  if [ ${NEWSPEED} -gt ${MINSPEED} ] || [ ${NEWSPEED} -lt ${MAXSPEED} ] && [ ${ISNUMBER} ]
    then
      printf "%0.2f\n" ${NEWSPEED}
    else
      echo "Something went wrong"
  fi

}