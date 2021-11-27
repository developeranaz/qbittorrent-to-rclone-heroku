#!/bin/bash
curl -L $RCLONE_CONFIG_IN_RAW_URL >/root/.config/rclone/rclone.conf
echo $PORT >/PORT
curl -L $QBITTORRENT_CONFIG_IN_RAW_URL >/root/.config/qBittorrent/qBittorrent.conf
while :
do
jupyter notebook --ip=0.0.0.0 --port="$(cat /PORT)" --NotebookApp.token='' --NotebookApp.password=''
qbittorrent-nox --webui-port="$(cat /PORT)"
done
