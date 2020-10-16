# cleanup
docker system prune -f

# cde-baseimage
Write-Host -ForegroundColor Green "Build cde-baseimage"

docker pull debian:9

docker build --rm -t xcdr/cde-baseimage cde-baseimage

if ($?) {
    docker push xcdr/cde-baseimage
}

# cde-java
Write-Host -ForegroundColor Green "Build cde-java"

docker build --rm -t xcdr/cde-java cde-java

if ($?) {
    docker push xcdr/cde-java
}

# cde-rbenv
Write-Host -ForegroundColor Green "Build cde-rbenv"

docker build --build-arg RUBY_VERSION=2.3.7 --build-arg LIBSSL_PACKAGE=libssl1.0-dev --rm -t xcdr/cde-rbenv:2.3 cde-rbenv

if ($?) {
    docker push xcdr/cde-rbenv:2.3
}

docker build --build-arg RUBY_VERSION=2.4.4 --rm -t xcdr/cde-rbenv:2.4 cde-rbenv 

if ($?) {
    docker push xcdr/cde-rbenv:2.4
}

docker build --build-arg RUBY_VERSION=2.4.4 --rm -t xcdr/cde-rbenv:latest cde-rbenv 

if ($?) {
    docker push xcdr/cde-rbenv:latest
}

# cde-roundcube
Write-Host -ForegroundColor Green "Build cde-roundcube"

docker pull php:7.2-apache

docker build --rm -t xcdr/cde-roundcube:1.3 cde-roundcube 

if ($?) {
    docker push xcdr/cde-roundcube
}

# cleanup
docker system prune -f
