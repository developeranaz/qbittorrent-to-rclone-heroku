#!/bin/bash

# Created by DevAnaZ
# run example below
# docker_build_and_run_for_VPS.sh -c 8080 -p newpassword -u newusername


while getopts ":u:p:c:" opt; do
  case $opt in
    u) username="$OPTARG"
    ;;
    p) password="$OPTARG"
    ;;
    c) port="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done




cd
apt install git -y
rm -r .devanaztempinstall
mkdir .devanaztempinstall
cd .devanaztempinstall
git clone https://github.com/developeranaz/qbittorrent-to-rclone-heroku
cd qbittorrent-to-rclone-heroku

docker build .

docker images |head -2| tail -1 |sed 's/ /\n/g' |sed '/^$/d' |head -3| tail -1 >imagename

cd
rm -r .devanaztempinstall
docker run -td -e username="$username" -e password="$password" -p $port:8880 "$(docker images |head -2| tail -1 |sed 's/ /\n/g' |sed '/^$/d' |head -3| tail -1)"
