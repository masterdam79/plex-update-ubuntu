#!/bin/bash

# Include
source functions.sh

if [[ ${PLEXVERSION} == "" ]]; then
  # Plex media server is not installed
  ECHORED "Plex media server is not installed"
fi

ECHOSILVER "Current version: ${PLEXVERSION}"
echo "Current version: ${DEBVERSION}"
ECHOYELLOW "We'll download the newest version of Plex from this URL: "
ECHOSILVER "${DEBURL}"
ASKFORIT PROCEED "Proceed? (y/n): "

if [[ ${PROCEED} == "y" ]]; then
  if [[ ${PLEXVERSION} == "" ]]; then
    # Plex media server is not installed
    ECHOGREEN "Installing Plex Media Server"
    # Call DOWNLOADINSTALL function
    DOWNLOADINSTALL
  else
    # Plex media server is installed
    ECHOGREEN "Updating Plex Media Server"
    VERSIONCHECK=$(echo ${DEBURL} | grep ${PLEXVERSION})
    if [[ ${VERSIONCHECK} == "" ]]; then
      # Currently installed Plex Media Server is a different version than the one available for download, updating.
      ECHOGREEN "Currently installed Plex Media Server is a different version than the one available for download, updating."
      # Call DOWNLOADINSTALL function
      DOWNLOADINSTALL
    else
      # Currently installed Plex Media Server is the same version, no update needed.
      ECHORED "Currently installed Plex Media Server is the same version, no update needed."
    fi
  fi

fi
