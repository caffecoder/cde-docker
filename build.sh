#!/usr/bin/env bash

#DANGLING=$(docker images -f "dangling=true" -q)
#
#if [ ! -z $DANGLING ]; then
#    docker rmi $DANGLING
#fi

docker pull ubuntu:16.04

docker image prune -f

docker build --squash --rm -t xcdr/cde-baseimage cde-baseimage

docker build --squash --rm -t xcdr/cde-java cde-java

docker build --squash --build-arg RUBY_VERSION=2.3.4 --rm -t xcdr/cde-rbenv:2.3 cde-rbenv
docker build --squash --build-arg RUBY_VERSION=2.3.4 --rm -t xcdr/cde-rbenv:latest cde-rbenv

docker build --squash --rm -t xcdr/cde-syslog cde-syslog

docker image prune -f
