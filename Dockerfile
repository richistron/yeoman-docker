FROM node:5-slim

MAINTAINER Ricardo Rivas <richistron@gmail.com>

# environment
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 3000

# apt packages
RUN apt-get -y update && apt-get -y install git curl net-tools ruby-compass

# npm global dependencie
RUN npm install -g yo bower gulp
RUN npm install -g generator-gulp-angular

# creating user yeoman
RUN adduser --disabled-password --gecos "" yeoman && \
      echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# yeoman home
ENV HOME /home/yeoman
ENV LANG en_US.UTF-8

# working dir
RUN mkdir /src && chown yeoman:yeoman /src
WORKDIR /src

# app bootstrap
ADD bootstrap.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/bootstrap.sh
ENTRYPOINT ["bootstrap.sh"]

# login as yeoman
USER yeoman
CMD /bin/bash
