<?php
declare(strict_types=1);

ini_set('session.use_strict_mode', '1');
ini_set('session.use_trans_sid', '0');
ini_set('session.cookie_httponly', '1');

$isHttps = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off')
    || (isset($_SERVER['SERVER_PORT']) && (int)$_SERVER['SERVER_PORT'] === 443);

session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => '',
    'secure' => $isHttps,
    'httponly' => true,
    'samesite' => 'Lax',
]);

session_start();

$inactiveLimit = 1800; //30 minutes
$now = time();

if (isset($_SESSION['last_activity']) && ($now - (int)$_SESSION['last_activity']) > $inactiveLimit) {
    $_SESSION = [];
    if (ini_get('session.use_cookies')) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $params['path'], $params['domain'], $params['secure'], $params['httponly']);
    }
    session_destroy();
}

$_SESSION['last_activity'] = $now;

/*
 *
 * Parti de test pour la connection BDD
 *
 */

require dirname(__DIR__) . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__));
$dotenv->safeLoad();

$dbConfig = require dirname(__DIR__) . '/config/database.php';

$database = new App\Service\Database($dbConfig);
$pdo = $database->pdo();

$stmt = $pdo->query('SELECT 1');
echo "DB connection OK";