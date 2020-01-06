#!/bin/bash

while ! psql -h localhost -U postgres orthanc -c 'select now()'; do sleep 0.1; done
Orthanc
