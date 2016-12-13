FROM ubuntu:16.04
MAINTAINER Adam Kubica <caffecoder@kaizen-step.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen pl_PL.UTF-8

RUN rm /etc/localtime
RUN echo "Europe/Warsaw" > /etc/timezone
RUN dpkg-reconfigure tzdata

RUN apt-get update && apt-get dist-upgrade -y && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
