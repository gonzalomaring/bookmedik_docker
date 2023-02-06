FROM debian:bullseye
MAINTAINER Gonzalo Marin "gonzalomaringomez@gmail.com"
RUN apt update && apt upgrade -y && apt install apache2 libapache2-mod-php php php-mysql mariadb-client -y && apt clean && rm -rf /var/lib/apt/lists/*
ADD bookmedik /var/www/html/
ADD script.sh /opt/
RUN chmod +x /opt/script.sh && rm /var/www/html/index.html
ENTRYPOINT ["/opt/script.sh"]
