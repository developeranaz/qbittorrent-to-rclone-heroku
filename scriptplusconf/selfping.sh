#!/bin/bash
while :
do
sleep 1440
curl -L "SELFPINGURL"
curl -L "$PINGDOMAIN"
done
