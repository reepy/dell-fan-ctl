#!/usr/local/bin/zsh

# These should be set as environment variables.
# Alternatively set them here.

## IMPI settings
#IPMIHOST=
#IPMIUSER=
#IPMIPASS=

## Fan speed settings
### Which fan to check
FAN="Fan1A"
### What's the minimum fan speed you want to run it at
MINSPEED=15
### What's the maximum fan speed you're happy is quiet
MAXSPEED=25

## Temperature settings
### CPU Temp IPMI ID
TEMPCPUID="Temp"
### What's the normal temp of your CPU
MINTEMP=32
### What's the max temp of your CPU before auto kicks in again
MAXTEMP=50