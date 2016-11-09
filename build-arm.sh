CURRENT_DIR=${PWD}

# Build the http image for arm
git clone https://github.com/docker-library/httpd.git /tmp/httpd
cd /tmp/httpd/2.4/alpine
sed -e 's/FROM alpine:3.4/FROM alpine-arm:3.4/' Dockerfile > Dockerfile.arm
docker build -t httpd-arm:alpine -f Dockerfile.arm .
cd ${PWD}
rm -f /tmp/httpd

# Build from the httpd arm image
docker build -t webdav:rpi-alpine -f Dockerfile.arm .
