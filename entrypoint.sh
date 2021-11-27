#!/bin/bash
mkdir /.config
mkdir /.config/rclone
curl -L $RCLONE_CONFIG_IN_RAW_URL >/.config/rclone/rclone.conf
echo $PORT >/PORT
#curl -L $QBITTORRENT_CONFIG_IN_RAW_URL
cat /qBittorrent/config/qBittorrent.conf >/qBittorrent/qBittorrent.conf
echo $WEBPASSWORD
WEBHASHPASSWORD=
cat /qBittorrent/qBittorrent.conf |sed "s|devanaz|$(rclone listremotes |head -1)|g" |sed "s|developeranaz|$WEBUSERNAME|g" |sed "s||$WEBHASHPASSWORD|g" >/qBittorrent/config/qBittorrent.conf
while :
do
qbittorrent-nox --profile=/ --webui-port="$(cat /PORT)"
done
