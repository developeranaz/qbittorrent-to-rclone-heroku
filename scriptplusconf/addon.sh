#!/bin/bash

mkdir --parents /qBittorrent/downloads/
curl "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/about.html" > /var/www/html/about.html
