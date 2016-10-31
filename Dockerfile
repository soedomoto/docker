FROM ubuntu:xenial
MAINTAINER Aris Prawisudatama <soedomoto@gmail.com>

# Update repositories
RUN apt-get update

# Install desktop and vncserver
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core tightvncserver
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xtightvncviewer

# Set workdir
RUN mkdir -p /display

# Copy necessary files
COPY desktop.sh /display
RUN chmod +x /display/desktop.sh

ENTRYPOINT /display/desktop.sh

CMD /bin/bash
