FROM ubuntu:16.04
MAINTAINER Adam Kubica <caffecoder@kaizen-step.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen pl_PL.UTF-8

RUN rm /etc/localtime
RUN echo "Europe/Warsaw" > /etc/timezone
RUN dpkg-reconfigure tzdata

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y apt-transport-https
RUN apt-get dist-upgrade -y

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
