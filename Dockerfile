FROM developeranaz/qbittorrent-rclone-heroku
RUN apt update 
#RUN apt install unzip qbittorrent-nox curl -y
#RUN apt install rclone -y
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
RUN apt install jupyter -y
CMD /entrypoint.sh
