# FROM ubuntu:latest
# MAINTAINER vshivangi51@gmail.com
# RUN apt-get update && \
#     apt-get install -y nginx zip unzip && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
# # RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/brighton.zip /var/www/html
# WORKDIR /var/www/html/
# RUN unzip brighton.zip
# RUN cp -rvf brighton-*/* .
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
FROM nginx:latest

COPY index.html /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
