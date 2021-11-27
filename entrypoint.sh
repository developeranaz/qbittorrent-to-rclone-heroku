#!/bin/bash
curl -L $RCLONE_CONFIG_IN_RAW_URL >/root/.config/rclone/rclone.conf
echo $PORT >/PORT
#curl -L $QBITTORRENT_CONFIG_IN_RAW_ZIP >/root/.config/qBittorrent/qBittorrent.conf
while :
do
qbittorrent-nox --profile=/root/x/ --webui-port="$(cat /PORT)"
done
