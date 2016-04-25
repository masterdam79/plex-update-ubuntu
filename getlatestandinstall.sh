#!/bin/bash

# Include
source functions.sh

# Nice clean URL
DEBURL=$(curl -s https://plex.tv/downloads | grep amd64.deb | grep -v binaries | sed 's/\s.*<a href="//g' | sed 's/\.deb.*<\/a>/.deb/g')

# Current Plex media server version if installed
PLEXVERSION=$(dpkg -s plexmediaserver | grep Version | awk '{print $2}')

if [[ ${PLEXVERSION} == "" ]]; then
  # Plex media server is not installed
  ECHORED "Plex media server is not installed"
fi

ECHOYELLOW "We'll download the newest version of Plex from this URL: "
ECHOSILVER "${DEBURL}"
ASKFORIT PROCEED "Proceed? (y/n): "

if [[ ${PROCEED} == "y" ]]; then
  #statements
fi
