#!/bin/bash
curl "$RCLONE_CONFIG_IN_RAW_URL" >$(rclone config file |grep 'rclone.conf')
echo $PORT >/PORT
