FROM ubuntu
RUN apt update 
RUN apt install unzip qbittorrent-nox curl -y
RUN curl https://rclone.org/install.sh >/install.sh
RUN bash install.sh
CMD 
