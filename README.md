# Personal gentoo overlay
*Remeber that by using third-party git overlays you are putting
your sistem at risk.*

## Setup notes
This overlay is not verified to be working smootly with eselect.

In order to use this overlay simply checkout this repo into `/var/db/repos/local`.
And add `/etc/portage/repos.conf/local` file with the corresponding location.

## Packages included:
* **x11-misc/i3lock-color**
  Popular fork of simple i3 locker.
* **x11-misc/xkb-switch**
  Switch keyboard layouts from command line.
* **dev-scheme/chez-scheme**
  Implementation of R6RS developed by Cisco.
