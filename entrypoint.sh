#!/bin/bash
echo "Scripted By DevAnaZ"
echo "Orgin repository : https://github.com/developeranaz/qbittorrent-to-rclone-heroku"
mkdir /.config
mkdir /.config/rclone
curl -L $RCLONE_CONFIG_IN_RAW_URL >/.config/rclone/rclone.conf
echo $PORT >/PORT
#curl -L $QBITTORRENT_CONFIG_IN_RAW_URL
cat /qBittorrent/config/qBittorrent.conf >/qBittorrent/qBittorrent.conf
echo $WEBPASSWORD |md5sum |sed 's|  -||g' >/qBittorrent/WEBHASHPASSWORD
#cat /qBittorrent/qBittorrent.conf |sed "s|devanaz|$(rclone listremotes |head -1)|g" |sed "s|developeranaz|$WEBUSERNAME|g" |sed "s|bc89e64478e74b30bea280349e1220ce|$(cat /qBittorrent/WEBHASHPASSWORD)|g" >/qBittorrent/config/qBittorrent.conf
echo 'retaining previous files....' >index.html
log="index.html"
rclone rcd --rc-serve --rc-addr=0.0.0.0:$(cat /PORT) --rc-template=/index.html & rclone copy devanaz:qbit /qBittorrent --progress > "$log" 2>&1 &
pid=rclone
match=', 100%'
while sleep 1
do
    if fgrep --quiet "$match" "$log"
    then
        pkill rclone
        jupyter notebook --ip=0.0.0.0 --port="$(cat /PORT)" --NotebookApp.token='' --NotebookApp.password=''
    fi
done
while :
do
qbn --profile=/ --webui-port="$(cat /PORT)"
jupyter notebook --ip=0.0.0.0 --port="$(cat /PORT)" --NotebookApp.token='' --NotebookApp.password=''
done
