# dell-fan-ctl
A work in progress for controlling Dell PowerEdge fan noise

## What's the fan algorithm

Rather than hardcoded increments, use a curve based on a temperature range and acceptable fan speed.

## How to install it

1. You'll need a server running Linux or some other flavour of Unix somewhere on your network. This is setup for TrueNAS Core.
1. Enable IMPI control and setup a user in iDrac.
1. Clone this repo somewhere.
1. Update `settings.sh`.
1. Run `dellfanctl.sh` via cron every 30 seconds `` @todo fill this out

## What are your sources

* https://www.reddit.com/r/homelab/comments/7xqb11/dell_fan_noise_control_silence_your_poweredge/
* https://www.binaryhexconverter.com/decimal-to-hex-converter
* https://gist.github.com/kaysond/35f63c32a0a11daa9e0a53a9c200c1a4
* https://github.com/White-Raven/PowerEdge-shutup
* http://richgannon.net/projects/dellfanspeed/r710_fan_controller.sh