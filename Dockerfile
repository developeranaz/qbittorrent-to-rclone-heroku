FROM developeranaz/qbittorrent-rclone-heroku
RUN apt update 
RUN apt install parallel -y
RUN apt install jupyter -y
COPY entrypoint.sh /entrypoint.sh 
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
RUN chmod +x /entrypoint.sh
COPY parallel.txt /parallel.txt
CMD parallel < /parallel.txt
