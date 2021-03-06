#!/bin/bash
set -e

rm -f ${APACHE_RUN_DIR}/apache2.pid
mkdir -p /var/www/data
touch /var/www/data/.ocdata
envsubst < /config.php.tmpl > /var/www/html/config/config.php

cd /var/www/html
if ! php occ upgrade
then
  sed -ie "s/'installed' => true/'installed' => false/" /var/www/html/config/config.php
  php occ maintenance:install --admin-pass=admin
fi

exec "$@"
