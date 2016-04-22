#!/usr/bin/env bash

for item in `ls -d cde-*`; do
    docker build --rm -t "caffecoder/${item}" $item
done
