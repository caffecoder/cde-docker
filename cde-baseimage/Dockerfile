FROM debian:9
MAINTAINER Adam Kubica <xcdr@kaizen-step.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Warsaw

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y apt-transport-https
RUN apt-get install -y locales
RUN apt-get install -y tzdata
RUN apt-get install -y dirmngr
RUN apt-get install -y curl
RUN apt-get dist-upgrade -y

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN locale-gen pl_PL.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
