#!/bin/bash
curl -L $RCLONE_CONFIG_IN_RAW_URL >/root/.config/rclone/rclone.conf
echo $PORT >/PORT
curl -L $QBITTORRENT_CONFIG_IN_RAW_URL >/qBittorrent/config/qBittorrent.conf
while :
do
qbittorrent-nox --profile=/ --webui-port="$(cat /PORT)"
done
