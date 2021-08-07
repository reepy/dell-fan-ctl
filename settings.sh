#!/usr/local/bin/zsh

# These should be set as environment variables.
# Alternatively set them here.

## IMPI settings
#IMPIHOST=
#IMPIUSER=
#IMPIPASS=

## Fan speed settings
### Which fan to check
FAN="Fan1A"
### What's the minimum fan speed you want to run it at
MINSPEED=15
### What's the maximum fan speed you're happy is quiet
MAXSPEED=40

## Temperature settings
### What's the normal temp of your CPU
MINTEMP=30
### What's the max temp of your CPU before auto kicks in again
MAXTEMP=60