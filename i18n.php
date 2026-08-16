<?php
if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}
require_once(__DIR__ . '/config/mysql.php');

// Determine language: GET param overrides, then session, then default to 'fr'
if (isset($_GET['lang'])) {
    $lang = $_GET['lang'];
    $_SESSION['lang'] = $lang;
} elseif (isset($_SESSION['lang'])) {
    $lang = $_SESSION['lang'];
} else {
    $lang = 'fr';
}

$langFile = __DIR__ . '/lang/' . $lang . '.php';
if (!file_exists($langFile)) {
    $langFile = __DIR__ . '/lang/fr.php';
}
$TRANSLATIONS = require $langFile;

function __($key, $default = '') {
    global $TRANSLATIONS;
    return $TRANSLATIONS[$key] ?? $default;
}
?>