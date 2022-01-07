FROM developeranaz/qbittorrent2rclone:beta1
#FROM developeranaz/qbittorrent-rclone-heroku
#RUN apt update 
#RUN apt install unzip 
#RUN apt install qbittorrent-nox -y
#curl -y
#RUN apt install rclone -y
COPY entrypoint.sh /entrypoint.sh 
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
