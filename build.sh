#!/usr/bin/env bash

docker system prune -f

docker pull debian:9
docker build --rm -t xcdr/cde-baseimage cde-baseimage && docker push xcdr/cde-baseimage

docker build --rm -t xcdr/cde-java cde-java && docker push xcdr/cde-java

docker build --build-arg RUBY_VERSION=2.3.7 --build-arg LIBSSL_PACKAGE=libssl1.0-dev --rm -t xcdr/cde-rbenv:2.3 cde-rbenv && docker push xcdr/cde-rbenv:2.3
docker build --build-arg RUBY_VERSION=2.4.4 --rm -t xcdr/cde-rbenv:2.4 cde-rbenv && docker push xcdr/cde-rbenv:2.4
docker build --build-arg RUBY_VERSION=2.4.4 --rm -t xcdr/cde-rbenv:latest cde-rbenv && docker push xcdr/cde-rbenv:latest

docker pull alpine:3.8
docker build --rm -t xcdr/cde-syslog cde-syslog && docker push xcdr/cde-syslog

docker pull php:7.2-apache
docker build --rm -t xcdr/cde-roundcube:1.3 cde-roundcube && docker push xcdr/cde-roundcube

docker system prune -f

