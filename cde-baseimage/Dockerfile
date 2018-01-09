FROM debian:9

LABEL maintainer="Adam Kubica <xcdr@kaizen-step.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Warsaw

COPY sources.list /etc/apt/sources.list

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

RUN sed -i -e 's/# pl_PL.UTF-8 UTF-8/pl_PL.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen pl_PL.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
