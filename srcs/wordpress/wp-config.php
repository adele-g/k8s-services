<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'lnymella' );

define( 'DB_PASSWORD', '123' );
/** MySQL hostname */
define( 'DB_HOST', 'mysql:3306' );
define('WP_HOME', 'http://192.168.99.103:5050');
define('WP_SITEURL', 'http://192.168.99.103:5050');

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

$table_prefix = 'wp_';


define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
