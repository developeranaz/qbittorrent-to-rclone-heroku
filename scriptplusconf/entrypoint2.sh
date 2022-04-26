#!/bin/bash
XATH=/scriptplusconf
#SELFPING='newapp'

echo "$selfping $Selfping $SelfPing $SELFPING $PINGDOMAIN" >$XATH/selfping
if grep -i "[A-Za-z]" $XATH/selfping
then
    echo "found"
    rawping=$( cat $XATH/selfping |sed 's/ //g' |grep [A-Za-z] |sed 's/^https:\/\/\|^http:\/\///g' |sed 's/.herokuapp.com//g' |sed 's@^@https://@g' |sed 's@$@.herokuapp.com/ping@g')
    echo "$rawping"
    sed -i "s|SELFPINGURL|$rawping|g" $XATH/selfping.sh
    chmod +x $XATH/selfping.sh
    sed -i "s@\$XATH@$XATH@g" /scriptplusconf/supervisord.conf
    supervisord -c /scriptplusconf/supervisord.conf
    curl -L https://github.com/WDaan/VueTorrent/releases/download/v0.15.4/vuetorrent.zip
    unzip vuetorrent.zip
else
    echo "No selfping url or appname found, hence not using supervisord"
    echo "You can add selfping by adding a env var in heroku, SELFPING and correspondingly its value as your appname or appurl"
    echo "Note: 'SELFPING' uses more RAM and takes up a lot of free dynos, and your app will stop working when your allocated dyno hours are exceeded."
    mkdir /.config
    mkdir /.config/rclone
    curl -L $RCLONE_CONFIG_IN_RAW_URL >/.config/rclone/rclone.conf
    echo $PORT >/PORT
    cat /qBittorrent/config/qBittorrent.conf >/qBittorrent/qBittorrent.conf
    echo -n "$WEBPASSWORD" |md5sum |sed 's|  -||g' >/qBittorrent/WEBHASHPASSWORD
    cat /qBittorrent/qBittorrent.conf |sed "s|devanaz:|$(rclone listremotes |head -1)|g" |sed "s|developeranaz|$WEBUSER|g" |sed "s|bc89e64478e74b30bea280349e1220ce|$(cat /qBittorrent/WEBHASHPASSWORD)|g" >/qBittorrent/config/qBittorrent.conf
    curl -L https://github.com/WDaan/VueTorrent/releases/download/v0.15.4/vuetorrent.zip
    unzip vuetorrent.zip
    while :
    do
       qbittorrent-nox --profile=/ --webui-alternativeuienabled="true" --webui-rootfolder="/vuetorrent/" --webui-port="$(cat /PORT)"
    done
fi
