# Dell fan controller for TrueNAS
A work in progress for controlling Dell PowerEdge fan noise on TrueNAS.

## What's the fan algorithm

Rather than hardcoded increments, use a ratio based on a temperature range and acceptable fan speed.

## How to install it

1. You'll need a TrueNAS server. It will also work on other flavours, but it assumes zsh and TrueNAS.
1. Enable IMPI control and setup a user in iDrac.
1. Clone this repo to a pool/dataset.
1. Update `settings.sh`.
1. Run `dellfanctl.sh` via cron every 30 seconds `` @todo fill this out

## What are your sources

* https://www.reddit.com/r/homelab/comments/7xqb11/dell_fan_noise_control_silence_your_poweredge/
* https://gist.github.com/kaysond/35f63c32a0a11daa9e0a53a9c200c1a4
* https://github.com/White-Raven/PowerEdge-shutup
* http://richgannon.net/projects/dellfanspeed/r710_fan_controller.sh