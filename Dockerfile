FROM httpd:alpine
# Conf for only webdav that serve data

# WebDav lock db
RUN mkdir -p /usr/local/apache2/var/
RUN chmod 777 /usr/local/apache2/var

# Datas
RUN rm -f /usr/local/apache2/htdocs/*
RUN chmod 777 /usr/local/apache2/htdocs
VOLUME /usr/local/apache2/htdocs/

# SSL
RUN mkdir /ssl
VOLUME /ssl

# Configuration
COPY docker/webdav.conf /usr/local/apache2/conf/httpd.conf
COPY docker/ssl.conf /usr/local/apache2/conf/ssl.conf

# Start with creating ht password
COPY docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
CMD docker-entrypoint.sh
