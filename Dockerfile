FROM node:5-slim

MAINTAINER Ricardo Rivas <richistron@gmail.com>

# environment
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 3000

# apt packages
RUN apt-get -y update && apt-get install git -y

# npm global dependencies for yeoman gulp or grunt
RUN npm install -g yo bower generator-webapp gulp

# creating user webuser
RUN adduser --disabled-password --gecos "" webuser && \
      echo "webuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# webuser home
ENV HOME /home/webuser
ENV LANG en_US.UTF-8

# working dir
RUN mkdir /src && chown webuser:webuser /src
WORKDIR /src

# app bootstrap
ADD bootstrap /usr/local/sbin/
RUN chmod +x /usr/local/sbin/bootstrap
ENTRYPOINT ["bootstrap"]

# login as webuser
USER webuser
CMD /bin/bash
