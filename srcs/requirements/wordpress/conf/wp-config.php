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
define('AUTH_KEY',         '}-=-l`+G>(zt)o_!+<CENYwI9fQS@gDoxB&xP#hIm6X&eIjm8..IcfHcu%gOGOp8');
define('SECURE_AUTH_KEY',  '!+MR-p}]&&91V+C}LtCqZ4q(6-o4>AZW*! FWNLOU:gnaIj6$V,sV;bV>inOQpHT');
define('LOGGED_IN_KEY',    'PdSWn@2qgicG|qd2|L}Y-{U{sI:Ewtm*D)BnKF#VT|Z$--5y.+AC3|>w&WjCA-S7');
define('NONCE_KEY',        '3Ojyead8_ XRsamGN%)]$+nZUR-I2!su#xx.1>Yrk(V)2a#:j&Db LrqQ]C)qVCX');
define('AUTH_SALT',        'NDlzjU?2LN-j80Bqgp88frMV7!DCo$yDQK-N0BmHWrb<dt8,P%p,+4T! -+AEN+1');
define('SECURE_AUTH_SALT', 'dns rt&=|1[FiS_5@W@si5!k-LX~EYBW<-=[K%qVn$2u]2p~qUJ4c.aRm4FnZS<;');
define('LOGGED_IN_SALT',   'u_W$=31.yf3OM}^J-3~xq[D&VjI=k6U#66, @uqB|3wTa;yt +$6Yip]mNQ$$Wbz');
define('NONCE_SALT',       '^-&R76|).8JLQw3:g#^_nqTvmBN-),;nhx2 |>W8ofI#`g.>YF6`(r0xJeOWlYjn');
/**#@-*/

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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
