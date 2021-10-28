<?php
if (getenv("REDIS_HOST")) {
    $CONFIG = array(
       'memcache.local' => '\\OC\\Memcache\\Redis',
       'redis' =>
         array (
           'host' => getenv('REDIS_HOST'),
           'port' => getenv('REDIS_PORT') ?: 6379,
           'timeout' => getenv('REDIS_TIMEOUT') ?: 0.0,
           'dbindex' => getenv('REDIS_DB') ?: 0,
         ),
    );
    if(getenv('REDIS_PASSWORD')) {
        $CONFIG['redis']['password'] = getenv('REDIS_PASSWORD');
    }
}
