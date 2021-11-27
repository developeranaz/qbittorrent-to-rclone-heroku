FROM developeranaz/qbittorrent-rclone-heroku
RUN apt update 
#RUN apt install unzip qbittorrent-nox curl -y
#RUN apt install rclone -y
COPY entrypoint.sh /entrypoint.sh 
COPY qBittorrent.conf /qBittorrent.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
