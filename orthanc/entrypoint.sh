#!/bin/bash

while ! psql -h postgres -U postgres orthanc -c 'select now()'; do sleep 1; done
COUNT=0
#
# in gen3 /data/ presents as a mount point,
# but in docker-compose it just looks like a folder
#
while ! mount | grep '/data/' && [[ "$COUNT" -lt 20 ]]; do 
  sleep 1
  COUNT=$((COUNT + 1))
done

if [[ ! -d /data/ ]]; then
  echo "WARNING: no /data/?"
fi

Orthanc "$@"

