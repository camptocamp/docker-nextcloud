FROM ubuntu:18.04

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
        gettext-base apache2 libaprutil1-dbd-mysql libapache2-mod-php php-gd php-sqlite3 php-json php-intl \
        php-xml php-mbstring php-zip php-pgsql php-mysql ca-certificates curl php-curl php-imagick php-redis \
        unzip && \
    apt clean && \
    rm -r /var/lib/apt/lists/*

# nextcloud specific stuff
ENV NEXTCLOUD_VERSION=17 \
    DOLLAR=$
RUN curl https://download.nextcloud.com/server/releases/latest-${NEXTCLOUD_VERSION}.zip > /tmp/nextcloud.zip && \
    cd /var/www && \
    unzip /tmp/nextcloud.zip && \
    rm -r /tmp/nextcloud.zip html && \
    mv nextcloud html

COPY runtime /

ENV APACHE_CONFDIR=/etc/apache2 \
    APACHE_ENVVARS=/etc/apache2/envvars \
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_PID_FILE=/var/run/apache2/apache2.pid \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_LOG_DIR=/var/log/apache2 \
    LANG=C

RUN a2dissite 000-default && \
    a2ensite 000-nextcloud.conf && \
    a2enmod remoteip php7.2 rewrite && \
    a2disconf other-vhosts-access-log && \
    mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR && \
    sed -i -e 's/<VirtualHost \*:80>/<VirtualHost *:8080>/' /etc/apache2/sites-available/000-default.conf && \
    sed -i -e 's/Listen 80$/Listen 8080/' /etc/apache2/ports.conf && \
    find "$APACHE_CONFDIR" -type f -exec sed -ri ' \
       s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
       s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
       ' '{}' ';' && \
    adduser www-data root && \
    chmod -R g+w ${APACHE_CONFDIR} ${APACHE_RUN_DIR} ${APACHE_LOCK_DIR} ${APACHE_LOG_DIR} /var/log && \
    chgrp -R root ${APACHE_LOG_DIR}

ENV LANG=C.UTF-8 \
    REDIS_COMMENT=# \
    REDIS_DB=0
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2", "-DFOREGROUND"]

RUN chown -R www-data:root /var/www && \
    chmod -R g+w /var/www

USER www-data
