#!/bin/sh

# Checks if ELK is up (last container in stack to start)

HOST_IP=$(docker-machine ip worker2)
ATTEMPTS=16
SLEEPTIME=15

until curl -s --head "${HOST_IP}:8030";
do
  echo "Attempt ${ATTEMPTS}..."

  if [ $ATTEMPTS -eq 0 ]
  then
    break
  fi

  echo "Waiting ${SLEEPTIME} more seconds to see if things are working..."

  sleep $SLEEPTIME
  let ATTEMPTS-=1
done
