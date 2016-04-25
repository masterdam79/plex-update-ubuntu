#!/bin/bash

# Include
source functions.sh

# Nice clean URL, file & version
DEBURL=$(curl -s https://plex.tv/downloads | grep amd64.deb | grep -v binaries | sed 's/\s.*<a href="//g' | sed 's/\.deb.*<\/a>/.deb/g')
DEBFILE=$(echo ${DEBURL} | awk -F'/' '{print $6}')
DEBVERSION=$(echo ${DEBFILE} | awk -F'_' '{print $2}')

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
  if [[ ${PLEXVERSION} == "" ]]; then
    # Plex media server is not installed
    ECHOGREEN "Installing Plex Media Server"
  else
    # Plex media server is installed
    ECHOGREEN "Updating Plex Media Server"
    VERSIONCHECK=$(echo ${DEBURL} | grep ${PLEXVERSION})
    if [[ ${VERSIONCHECK} == "" ]]; then
      # Currently installed Plex Media Server is a different version than the one available for download, updating.
      ECHOGREEN "Currently installed Plex Media Server is a different version than the one available for download, updating."
      ECHOSILVER "Current version: ${PLEXVERSION}"
      echo "Current version: ${DEBVERSION}"
      wget ${DEBURL} -O /root/${DEBFILE}
      dpkg -i /root/${DEBFILE}
    else
      # Currently installed Plex Media Server is the same version, no update needed.
      ECHORED "Currently installed Plex Media Server is the same version, no update needed."
    fi
  fi

fi
