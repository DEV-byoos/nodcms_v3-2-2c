<?php
/*
 *  This file is part of NodCMS.
 *
 *  (c) Mojtaba Khodakhah <info@nodcms.com>
 *  https://nodcms.com
 *
 * For the full copyright and license information, please view
 * the LICENSE file that was distributed with this source code.
 *
 * Fork byoosdigital.com 2022/06/16
 */
 
// Path to the front controller (this file)
define('FCPATH', __DIR__ . DIRECTORY_SEPARATOR);

// Root directory
define("ROOTPATH", dirname(FCPATH).DIRECTORY_SEPARATOR);
// NodCMS core path
define("COREPATH", ROOTPATH."nodcms-core".DIRECTORY_SEPARATOR);
// NodCMS public path
define("SELF_PATH", FCPATH);
// Ensure the current directory is pointing to the front controller's directory
chdir(FCPATH);

/*
 *---------------------------------------------------------------
 * BOOTSTRAP THE APPLICATION
 *---------------------------------------------------------------
 * This process sets up the path constants, loads and registers
 * our autoloader, along with Composer's, loads our constants
 * and fires up an environment-specific bootstrapping.
 */

// Load our paths config file
// This is the line that might need to be changed, depending on your folder structure.
require FCPATH . '../nodcms-core/Config/Paths.php';
// ^^^ Change this line if you move your application folder

$paths = new Config\Paths();

// Find the requested protocol
$protocol_status = intval(isset($_SERVER['HTTPS']));
define("SSL_PROTOCOL", $protocol_status);
define("URL_PROTOCOL", $protocol_status ? "https://" : "http://");

// Find the base url
define("CONFIG_BASE_URL", URL_PROTOCOL.$_SERVER['HTTP_HOST'] . rtrim(dirname($_SERVER['PHP_SELF']), '/\\') . "/");

define("DB_CONFIG_PATH", COREPATH.'Config/Database.php');

// Location of the framework bootstrap file.
require rtrim($paths->systemDirectory, '\\/ ') . DIRECTORY_SEPARATOR . 'bootstrap.php';
define('BLOG_ADMIN_URL', base_url("admin-blog").'/');
define('GALLERY_ADMIN_URL',base_url('admin-gallery').'/');
define('PORTFOLIO_ADMIN_URL',base_url("admin-portfolio").'/');
define('SERVICES_ADMIN_URL',base_url("admin-services").'/');

// Load environment settings from .env files into $_SERVER and $_ENV
require_once SYSTEMPATH . 'Config/DotEnv.php';
(new CodeIgniter\Config\DotEnv(ROOTPATH))->load();

/*
 * ---------------------------------------------------------------
 * GRAB OUR CODEIGNITER INSTANCE
 * ---------------------------------------------------------------
 *
 * The CodeIgniter class contains the core functionality to make
 * the application run, and does all of the dirty work to get
 * the pieces all working together.
 */

$app = Config\Services::codeigniter();
$app->initialize();
$context = is_cli() ? 'php-cli' : 'web';
$app->setContext($context);

/*
 *---------------------------------------------------------------
 * LAUNCH THE APPLICATION
 *---------------------------------------------------------------
 * Now that everything is setup, it's time to actually fire
 * up the engines and make this app do its thang.
 */

$app->run();
