FROM caffecoder/cde-baseimage
MAINTAINER Adam Kubica <caffecoder@kaizen-step.com>

RUN apt-get update
RUN apt-get install -y syslog-ng bzip2

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/etc
RUN mkdir -p /opt/bin

ADD syslog-ng /opt/etc/syslog-ng
ADD bin/archive.sh /opt/bin/archive.sh

EXPOSE 514

VOLUME /mnt/logarch

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F" ,"-f", "/opt/etc/syslog-ng/syslog-ng.conf", "--no-caps"]
