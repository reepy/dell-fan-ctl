#!/usr/local/bin/zsh

function ipmi {
  # param: ipmi string
  ipmitool -I lanplus -H ${IPMIHOST} -U ${IPMIUSER} -P ${IPMIPASS} $(printf "%s" "${@}")
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
  ipmi "sdr get ${TEMPCPUID}" | grep "Sensor Reading" | cut -d ':' -f 2 | cut -d ' ' -f 2
}

function get-fanspeed {
  ipmi "sensor get ${FAN}" | grep "Sensor Reading" | cut -d ':' -f 2 | cut -d ' ' -f 2
}

function set-fanspeed {
  # param: % (which will be converted to hex)

  ipmi "raw 0x30 0x30 0x02 0xff 0x$(([##16]${1}))"

  # @todo work out whether this was successful or not

}

function calc-isnumber {
  if [[ ${1} =~ ^[+-]?([0-9]+([.][0-9]*)?|\.[0-9]+)$ ]]
    then
      echo 1
    else
      echo 0
  fi
}

function calc-fanspeed {
  # param: current temp

  CURRTEMP=${1}

  NEWSPEED=$(bc <<<"scale=2; ${MAXSPEED} - ( ${MINSPEED} / ( ${MINTEMP} / ( ${CURRTEMP} - ${MINTEMP} + 1 ) + 1 ) )")
  # @todo work out why we're getting 'dc: divide by zero' and remove the +1s

  WITHINMIN=$(bc <<< "${NEWSPEED} < ${MAXSPEED}")
  WITHINMAX=$(bc <<< "${NEWSPEED} > ${MINSPEED}")
  ISNUMBER=$(calc-isnumber ${NEWSPEED})

  if [ ${WITHINMIN} ] || [ ${WITHINMAX} ] && [ ${ISNUMBER} ]
    then
      printf "%u\n" ${NEWSPEED}
    else
      echo "Something went wrong"
  fi

}