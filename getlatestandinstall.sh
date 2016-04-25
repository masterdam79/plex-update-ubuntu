#!/bin/bash

# Include
source functions.sh

# Nice clean URL
DEBURL=$(curl -s https://plex.tv/downloads | grep amd64.deb | grep -v binaries | sed 's/\s.*<a href="//g' | sed 's/\.deb.*<\/a>/.deb/g')

ECHOYELLOW "We'll download the newest version of Plex from this URL: "
ECHOSILVER "${DEBURL}"
ASKFORIT PROCEED "Proceed?"
