#!/bin/sh
# Create htpassword file
if [ -n "${WEB_DAV_USER}" -a -n "${WEB_DAV_PASSWORD}" ]; then
    htpasswd -b -c -v /usr/local/apache2/.htpasswd ${WEB_DAV_USER} ${WEB_DAV_PASSWORD}
else
    echo "You didn't specify a web dav user or/and password. Your web dav will be fully open"
fi

# start apache
httpd-foreground