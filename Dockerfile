FROM nextcloud:14.0.4-apache

COPY config/* /usr/src/nextcloud/config/

ENV NEXTCLOUD_S3_BUCKET="" \
    NEXTCLOUD_S3_KEY="" \
    NEXTCLOUD_S3_SECRET="" \
    NEXTCLOUD_S3_SERVER="" \
    NEXTCLOUD_S3_PORT=443 \
    NEXTCLOUD_S3_USE_SSL=true \
    NEXTCLOUD_S3_REGION="" \
    NEXTCLOUD_AUTH_BRUTEFORCE=false

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
