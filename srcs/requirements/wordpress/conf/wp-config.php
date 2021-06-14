<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db' );

/** MySQL database username */
define( 'DB_USER', 'pmarash' );

/** MySQL database password */
define( 'DB_PASSWORD', 'biba' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '/Li6`<(/cYE*p1k1#@+9xOpH1WcLF2]jA-Bhl2+&:~en%6<mX .<J=PEU(do]r@T');
define('SECURE_AUTH_KEY',  'HDHa8827<6}VHUJY#Cjd*yY00ti5#.3ev+>sbUj=9Z1}=~m0`4YvRwoh-5$pn#Y:');
define('LOGGED_IN_KEY',    'h2_+I~H:wT{v:+cyk?In(_wNKn~tNw|V}#ByLh)YfdTuhtZtdh|^>qrx+3eYkaRg');
define('NONCE_KEY',        'mX +[vxO195zWe.st,s$3[!1Z-ixU+fAE?MxCXRXoM{:+aSd.Zw*#jvY5|J6?@f/');
define('AUTH_SALT',        'ol0TW$_W[VjtlXi-*iV0+-vI.`O*6#.8v:_n_ SNmT/8+kInuffM@P/)YD|D0`Y;');
define('SECURE_AUTH_SALT', 'xM]LHxF:+8yuI4{[H;`Wv@V>|0mV!|(l=pLN4w!/$S|z)iJ%O`yyU{9m]7YFQ!$$');
define('LOGGED_IN_SALT',   'B^-yZfvc+^U~5EONI$RR-#J@WL~1o>O am+<(&bam+uw~2ieXb|l?OJ Ajp wEV{');
define('NONCE_SALT',       'e/9-G|ffWzJiwswY.V`;rn36Ouah?2b 5bEbvKF96zIfZtan_M$erE .)0Ex^n5?');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

#$isSecure = false;
#if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
#    $isSecure = true;
#}
#elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
#    $isSecure = true;
#}
#$REQUEST_PROTOCOL = $isSecure ? 'https://' : 'http://';
#define( 'WP_CONTENT_URL', $REQUEST_PROTOCOL.$_SERVER['HTTP_HOST'] . '/wp-content');
#define( 'WP_HOME', $REQUEST_PROTOCOL.$_SERVER['HTTP_HOST'] );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
