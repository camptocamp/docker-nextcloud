# Next cloud docker image for OpenShift

This image works on OpenShift (doesn't run as root).

It works with a postgresql database and uses S3 as primary storage.

## Configuration:

You must define those environment variables:

* PGHOST
* PGDATABASE
* PGUSER
* PGPASSWORD
* PGPREFIX: Prefix to add to the table names.
* HOSTNAME: DNS name used to access nextcloud
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_DEFAULT_REGION
* AWS_S3_ENDPOINT
* AWS_BUCKET
* SMTP_HOST
* SMTP_USERNAME
* SMTP_PASSWORD
* SMTP_FROM_USER
* SMTP_FROM_DOMAIN

If you want to use redis as cache, you must define those:
* REDIS_COMMENT=" "
* REDIS_HOST=your.host.name
* REDIS_DB=0
