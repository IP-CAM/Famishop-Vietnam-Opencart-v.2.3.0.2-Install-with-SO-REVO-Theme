<?php

define('URL_HOME','http://'.$_SERVER['HTTP_HOST'].'/');

define('DIR_HOME',dirname(__FILE__)."/");

// HTTP
define('HTTP_SERVER', URL_HOME);

// HTTPS
define('HTTPS_SERVER', URL_HOME);



// DIR
define('DIR_APPLICATION', DIR_HOME.'catalog/');
define('DIR_SYSTEM', DIR_HOME.'system/');
define('DIR_IMAGE', DIR_HOME.'image/');
define('DIR_LANGUAGE', DIR_HOME.'catalog/language/');
define('DIR_TEMPLATE', DIR_HOME.'catalog/view/theme/');
define('DIR_CONFIG', DIR_HOME.'system/config/');
define('DIR_CACHE', DIR_HOME.'system/storage/cache/');
define('DIR_DOWNLOAD', DIR_HOME.'system/storage/download/');
define('DIR_LOGS', DIR_HOME.'system/storage/logs/');
define('DIR_MODIFICATION', DIR_HOME.'system/storage/modification/');
define('DIR_UPLOAD', DIR_HOME.'system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'famishopvn');
define('DB_PORT', '3306');
define('DB_PREFIX', 'wbc_');
