# Examples

## Create container
```shell
docker create -p 514:514 --net=host --name cde-syslog \
    -v /srv/cde-syslog/syslog-ng:/opt/etc/syslog-ng \
    -v /srv/cde-syslog/logarch:/mnt/logarch \
    caffecoder/cde-syslog
```

## Start container
```shell
docker start cde-syslog
```

## Archive old logs
```shell
/usr/bin/docker exec cde-syslog /opt/bin/archive.sh
```

## Test container
```shell
logger -n 127.0.0.1 -P 514 --udp --rfc3164 "Test logarch"
```

