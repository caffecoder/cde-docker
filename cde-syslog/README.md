# Examples

## Create container
```shell
docker create --net=host --env SYSLOG_PORT=1514 --name logarch \
    -v /mnt/logarch/conf:/opt/etc/syslog-ng \
    -v /mnt/logarch/data:/app_data \
    xcdr/cde-syslog
```

## Start container
```shell
docker start logarch
```

## Archive old logs
```shell
/usr/bin/docker exec logarch /opt/bin/archive_syslog.sh
```

## Test container
```shell
logger -n 127.0.0.1 -P 1514 --udp --rfc3164 "Test logarch"
```

