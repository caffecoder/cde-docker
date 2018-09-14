FROM xcdr/cde-baseimage

LABEL maintainer="Adam Kubica <xcdr@kaizen-step.com>"

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk-headless

RUN java -version
RUN javac -version

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

