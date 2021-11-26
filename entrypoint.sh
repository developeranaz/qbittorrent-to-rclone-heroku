#!/bin/bash
#curl -L $RCLONE_CONFIG_IN_RAW_URL >/root/.config/rclone/rclone.conf
echo $PORT >/PORT
curl -L $QBITTORRENT_CONFIG_IN_RAW_URL >/root/.config/qBittorrent/qBittorrent.conf
qbittorrent-nox --webui-port="$(cat /PORT)"
