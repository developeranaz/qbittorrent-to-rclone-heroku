#!/bin/bash
mkdir /root/.config
mkdir /root/.config/qBittorrent
mkdir /root/.config/rclone
curl -L "$RCLONE_CONFIG_IN_RAW_URL" >$(rclone config file |grep rclone.conf')
echo $PORT >/PORT
curl -L "$QBITTORRENT_CONFIG_IN_RAW_URL" >/root/.config/qBittorrent/qBittorrent.conf
