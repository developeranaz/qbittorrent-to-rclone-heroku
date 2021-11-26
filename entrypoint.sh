#!/bin/bash
mkdir /root/.config
mkdir /root/.config/qBittorrent
mkdir /root/.config/rclone
curl "$RCLONE_CONFIG_IN_RAW_URL" >$(rclone config file |grep rclone.conf')
echo $PORT >/PORT
curl -L "$QBITTORRENT_CONFIG_IN_RAW_URL" |sed "s|THEPORTNUMBER|$(/PORT)|g" >/root/.config/qBittorrent/qBittorrent.conf
