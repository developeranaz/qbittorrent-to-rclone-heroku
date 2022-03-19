#!/bin/bash
echo "Scripted By DevAnaZ"
echo "Orgin repository : https://github.com/developeranaz/qbittorrent-to-rclone-heroku"
mkdir /.config
mkdir /.config/rclone
curl -L $RCLONE_CONFIG_IN_RAW_URL >/.config/rclone/rclone.conf
echo $PORT >/PORT
#curl -L $QBITTORRENT_CONFIG_IN_RAW_URL
cat /qBittorrent/config/qBittorrent.conf >/qBittorrent/qBittorrent.conf
echo -n "$WEBPASSWORD" |md5sum |sed 's|  -||g' >/qBittorrent/WEBHASHPASSWORD
cat /qBittorrent/qBittorrent.conf |sed "s|devanaz:|$(rclone listremotes |head -1)|g" |sed "s|developeranaz|$WEBUSER|g" |sed "s|bc89e64478e74b30bea280349e1220ce|$(cat /qBittorrent/WEBHASHPASSWORD)|g" >/qBittorrent/config/qBittorrent.conf

while :
do
qbittorrent-nox --profile=/ --webui-port="$(cat /PORT)"
done
