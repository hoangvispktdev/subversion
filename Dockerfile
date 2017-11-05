FROM debian:stretch

RUN mkdir /usr/Nginx

RUN cd /usr/Nginx

RUN apt-get install -y wget

#Install Docker

#Update the apt package index
RUN apt-get update

#Install Nginx

#Download the Nginx repository signing key
RUN wget http://nginx.org/keys/nginx_signing.key

#Add the Nginx signing key to a system
RUN apt-key add nginx_signing.key

#Append Nginx repository to /etc/apt/sources.list file
RUN echo "deb http://nginx.org/packages/debian/ stretch nginx" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/debian/ stretch nginx" | tee -a /etc/apt/sources.list

#Install Nginx package using the following command
RUN apt-get update; apt-get -y install nginx

#Start the Nginx service after the installation
RUN systemctl start nginx.service

EXPOSE 22
