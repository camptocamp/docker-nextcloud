FROM nextcloud:13.0.7-apache

COPY config/s3.config.php /usr/src/nextcloud/config/s3.config.php

ENV NEXTCLOUD_S3_BUCKET="" \
    NEXTCLOUD_S3_KEY="" \
    NEXTCLOUD_S3_SECRET="" \
    NEXTCLOUD_S3_SERVER="" \
    NEXTCLOUD_S3_PORT=443 \
    NEXTCLOUD_S3_USE_SSL=true \
    NEXTCLOUD_S3_REGION=""

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
