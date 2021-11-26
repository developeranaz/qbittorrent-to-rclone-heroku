#!/bin/bash
curl "$RCLONE_CONFIG_IN_RAW_URL" >$(rclone config file |grep 'rclone.conf')
echo $PORT >/PORT
curl "$QBITTORRENT_CONFIG_IN_RAW_URL" >/root/qbittorrent/qBittorrent.conf
