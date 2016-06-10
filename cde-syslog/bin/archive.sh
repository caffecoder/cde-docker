#!/bin/sh

find /mnt/logarch -type f -name *.log -mmin +1440 -exec bzip2 {} \;
