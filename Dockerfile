FROM developeranaz/qbittorrent2rclone:beta1
#FROM developeranaz/qbittorrent-rclone-heroku
#RUN apt update 
#RUN apt install unzip 
#RUN apt install qbittorrent-nox -y
#curl -y
#RUN apt install rclone -y
RUN apt install supervisor -y
COPY scriptplusconf /scriptplusconf
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
RUN chmod +x /scriptplusconf/entrypoint2.sh
RUN chmod +x /scriptplusconf/entrypoint1.sh
CMD /scriptplusconf/entrypoint2.sh
