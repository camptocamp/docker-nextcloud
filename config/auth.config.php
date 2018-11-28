<?php

if (getenv("NEXTCLOUD_AUTH_BRUTEFORCE") != "") {

  $bruteforce = getenv("NEXTCLOUD_AUTH_BRUTEFORCE");

  $CONFIG = array (
    'auth.bruteforce.protection.enabled' => $bruteforce,
  );
}
