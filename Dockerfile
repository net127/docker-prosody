# source: https://index.docker.io/u/nolan/prosody/

FROM ubuntu:12.10
RUN apt-get update
RUN apt-get upgrade -y; apt-get clean
RUN apt-get install -y software-properties-common wget; apt-get clean
RUN add-apt-repository "deb http://packages.prosody.im/debian quantal main"
RUN wget https://prosody.im/files/prosody-debian-packages.key -O- | apt-key add -
RUN apt-get update
RUN apt-get install -y prosody lua-event lua-zlib; apt-get clean
EXPOSE 5222 5269 5280 5347
RUN echo include \"/etc/prosody/conf.d/*.cfg.lua\" >>/etc/prosody/prosody.cfg.lua
ADD conf.d /etc/prosody/conf.d
ENV __FLUSH_LOG 1
USER prosody
CMD prosody
