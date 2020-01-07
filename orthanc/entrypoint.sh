#!/bin/bash

while ! psql -h localhost -U postgres orthanc -c 'select now()'; do sleep 0.5; done
while ! mount | grep '/data/'; do sleep 0.5; done
Orthanc "$@"
