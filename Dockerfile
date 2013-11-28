# Prosody http://prosody.im/
#
# source: https://index.docker.io/u/nolan/prosody/

FROM ubuntu:12.10
MAINTAINER Glenn Powers "glenn@net127.com"

# Get ping
RUN apt-get install ping

# Copy the files into the container
ADD ./apt-proxy-check.sh /tmp/

RUN chmod 755 /tmp/apt-proxy-check.sh

# Check for a local apt-cache
RUN /tmp/apt-proxy-check.sh

# Configure apt
run     echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list

# Check for updates
RUN apt-get update
RUN apt-get upgrade -y; apt-get clean

# Install Deps
RUN apt-get install -y software-properties-common wget; apt-get clean

# Install Prosody
RUN add-apt-repository "deb http://packages.prosody.im/debian quantal main"
RUN wget https://prosody.im/files/prosody-debian-packages.key -O- | apt-key add -
RUN apt-get update
RUN apt-get install -y prosody lua-event lua-zlib; apt-get clean

# Expose Ports
EXPOSE 5222 5269 5280 5347

# Run it!
RUN echo include \"/etc/prosody/conf.d/*.cfg.lua\" >>/etc/prosody/prosody.cfg.lua
ADD conf.d /etc/prosody/conf.d
ENV __FLUSH_LOG 1
USER prosody
CMD prosody
