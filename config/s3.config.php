<?php

if (getenv("NEXTCLOUD_S3_BUCKET") && getenv("NEXTCLOUD_S3_KEY") && getenv("NEXTCLOUD_S3_SECRET") && getenv("NEXTCLOUD_S3_SERVER") && getenv("NEXTCLOUD_S3_REGION")) {

  $bucket = getenv("NEXTCLOUD_S3_BUCKET");
  $key = getenv("NEXTCLOUD_S3_KEY");
  $secret = getenv("NEXTCLOUD_S3_SECRET");
  $hostname = getenv("NEXTCLOUD_S3_SERVER");
  $port = getenv("NEXTCLOUD_S3_PORT");
  $use_ssl = getenv("NEXTCLOUD_S3_USE_SSL");
  $region = getenv("NEXTCLOUD_S3_REGION");


  $CONFIG = array (
    'objectstore' => array(
      'class' => 'OC\\Files\\ObjectStore\\S3',
      'arguments' => array(
        'bucket' => $bucket,
        'autocreate' => false,
        'key'    => $key,
        'secret' => $secret,
        'hostname' => $hostname,
        'port' => $port,
        'use_ssl' => $use_ssl,
        'region' => $region,
      ),
    ),
  );
}
