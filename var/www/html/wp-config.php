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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpressuser');

/** MySQL database password */
define('DB_PASSWORD', 'password');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'gB2O0;Ne0LKx.<kp%4A.Y~A-*-_&!-)I(Gbp-IB=uf.:Td|Pfv8;H|65p]loUd*S');
define('SECURE_AUTH_KEY',  'l>L[Wly|8P7x<%~fDbKH8RYzW2+lR[RJl%RgR^zft*|zlV~Ow8AfnLH2Mz V+75X');
define('LOGGED_IN_KEY',    'bWMp=4e#z:A!Ec;Bfv/;nFmTMu[IV@hNs~Bh*S,Kg/<gb`xLD+-/Iv:pJvZ{ye-F');
define('NONCE_KEY',        'E8Qb5gyUAdk~d|2N_ZC6kU(^q6o(ZI;$-?diw2 $8nZ<TTC-0!+|Bc` ~+Fut I=');
define('AUTH_SALT',        '7VGM+{qBbyIW|;PQ+EO!5 V+5LE&^IM|dVpp`(;hl;^:HR,-g<{voXcz,!-Hl<[Y');
define('SECURE_AUTH_SALT', 'zhguGg!Rpm9[nsA,fr,A?z8MmS%S&.WiOi]U+Ib4>P&7MlUbaza9C|raly0AI+r|');
define('LOGGED_IN_SALT',   '0yg&7#-uQz-wd3?C`?(ZR;Wm ve3w$=-Di GEt|[5.zei+[X*l{|Zv1n!k4A!f_o');
define('NONCE_SALT',       'UdWJx%AReBb<p>O-]|BUB~.psmu`_~.8#RO)Nbh+zavG3>h9:MOyBd&Z83g>Y*.&');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

define('FS_METHOD', 'direct');
