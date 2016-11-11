#!/bin/sh
# Create htpassword file
if [ -n "${WEB_DAV_USER}" -a -n "${WEB_DAV_PASSWORD}" ]; then
    htpasswd -b -c /usr/local/apache2/.htpasswd ${WEB_DAV_USER} ${WEB_DAV_PASSWORD}
else
    echo "You didn't specify a web dav user or/and password. Your web dav will be fully open"
fi

if [ -e "/ssl/cert.cert" -a -e "/ssl/cert.key" ]; then
    sed -e 's/Listen 80/#Listen 80/' /usr/local/apache2/conf/httpd.conf > /usr/local/apache2/conf/httpd.conf2
    sed -e 's@#Include /usr/local/apache2/conf/ssl.conf@Include /usr/local/apache2/conf/ssl.conf@' /usr/local/apache2/conf/httpd.conf2 > /usr/local/apache2/conf/httpd.conf3
    mv /usr/local/apache2/conf/httpd.conf3 /usr/local/apache2/conf/httpd.conf
    rm -f /usr/local/apache2/conf/httpd.conf2
fi

# start apache
httpd-foreground
