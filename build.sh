#!/usr/bin/env bash

DANGLING=$(docker images -f "dangling=true" -q)

if [ ! -z $DANGLING ]; then
    docker rmi $DANGLING
fi

docker pull ubuntu:16.04

docker build --rm -t caffecoder/cde-baseimage cde-baseimage

docker build --rm -t caffecoder/cde-storage cde-storage

docker build --rm -t caffecoder/cde-java cde-java

docker build --build-arg RUBY_VERSION=2.3.3 --rm -t caffecoder/cde-rbenv:2.3 cde-rbenv
docker build --build-arg RUBY_VERSION=2.3.3 --rm -t caffecoder/cde-rbenv:latest cde-rbenv

docker build --rm -t caffecoder/cde-syslog cde-syslog
