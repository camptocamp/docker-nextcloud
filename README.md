# Next cloud docker image

This image works on OpenShift (can run with arbitrary user).

It works with a postgresql database and can use S3 as primary storage.

## Configuration:
Environment variable available, trying to stick with the default provided at [nextcloud/docker](https://github.com/nextcloud/docker).

* `POSTGRES_DB`
* `POSTGRES_USER`
* `POSTGRES_PASSWORD`
* `POSTGRES_HOST`
* `NEXTCLOUD_ADMIN_USER`: Name of the Nextcloud admin user.
* `NEXTCLOUD_ADMIN_PASSWORD` Password for the Nextcloud admin user.
* `NEXTCLOUD_DATA_DIR` (default: /var/www/html/data) Configures the data directory where nextcloud stores all files from the users.
* `NEXTCLOUD_TRUSTED_DOMAINS`: (not set by default) Optional space-separated list of domains

* `OBJECTSTORE_S3_HOST`: The hostname of the object storage server
* `OBJECTSTORE_S3_BUCKET`: The name of the bucket that Nextcloud should store the data in
* `OBJECTSTORE_S3_KEY`: AWS style access key
* `OBJECTSTORE_S3_SECRET`: AWS style secret access key
* `OBJECTSTORE_S3_PORT`: The port that the object storage server is being served over
* `OBJECTSTORE_S3_SSL` (default: true): Whether or not SSL/TLS should be used to communicate with object storage server
* `OBJECTSTORE_S3_REGION`: The region that the S3 bucket resides in.
* `OBJECTSTORE_S3_USEPATH_STYLE` (default: false): Not required for AWS S3
* `OBJECTSTORE_S3_LEGACYAUTH` (default: false): Not required for AWS S3
* `OBJECTSTORE_S3_OBJECT_PREFIX` (default: urn:oid:): Prefix to prepend to the fileid
* `OBJECTSTORE_S3_AUTOCREATE` (default: true): Create the container if it does not exist

* `SMTP_HOST`
* `SMTP_NAME`
* `SMTP_PASSWORD`
* `SMTP_PORT`
* `SMTP_AUTHTYPE`
* `MAIL_FROM_ADDRESS`
* `MAIL_DOMAIN`

If you want to use redis as cache, you must define those:
* `REDIS_HOST`=your.host.name
* `REDIS_DB`=0
* `REDIS_PASSWORD`
* `REDIS_TIMEOUT`=0.0

If you want extra extension installed, specified then in the `NEXTCLOUD_EXTENSIONS` env var, separated by coma.

## Test env

Run

```
docker-compose up -d
```

Then go to `https://nextcloud-127-0-0-1.traefik.me`. Login is `admin`, password `admin`

To check out the webmail go to `https://webmail-127-0-0-1.traefik.me`.

