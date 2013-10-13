FROM ubuntu
MAINTAINER Ian Murray <ian@sprily.co.uk>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra -y

RUN mkdir /src
WORKDIR /src
RUN wget http://mosquitto.org/files/source/mosquitto-1.2.1.tar.gz
RUN tar xvzf ./mosquitto-1.2.1.tar.gz
WORKDIR /src/mosquitto-1.2.1
RUN pwd
RUN make
RUN make install
RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
ENTRYPOINT ["/usr/local/sbin/mosquitto"]
