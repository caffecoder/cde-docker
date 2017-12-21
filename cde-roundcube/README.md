# Docker Roundcube

This is base image without cpanel plugins.

Container require REDIS and MySQL listening on 172.12.0.1.

## Create container

    docker create -p 127.0.0.1:8080:80 \
        --env "MYSQL_HOST=10.0.0.2" \
        --env "MYSQL_PASSWD=SuperPasswd" \
        --restart unless-stopped \
        --name webmail xcdr/cde-roundcube

    docker start webmail

## Create and init database

    CREATE DATABASE webmail
    GRANT ALL PRIVILEGES ON webmail.* TO webmail@'172.17.0.%' IDENTIFIED BY 'SuperPasswd';

    docker exec -it  webmail /bin/bash
    mysql -u $MYSQL_USER -h $MYSQL_HOST webmail -p < SQL/mysql.initial.sql
