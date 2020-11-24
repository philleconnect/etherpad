FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive

ENV VERSION "latest"

USER root

LABEL maintainer="Dirk Winkel it@polarwinkel.de" version=latest description="an Etherpad-lite without external database that will be cleared on every rebuild"

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y gzip git curl python libssl-dev pkg-config build-essential
RUN apt-get install -y abiword

# unter Debian ist das node.js aus den Paketquellen nicht richtig:
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

#RUN useradd etherpad

#USER etherpad

RUN git clone git://github.com/ether/etherpad-lite.git

EXPOSE 9001

CMD etherpad-lite/bin/run.sh --root
