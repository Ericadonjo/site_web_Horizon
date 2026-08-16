<?php
    session_start();
    require_once(__DIR__ . '/config/mysql.php');
    require_once(__DIR__ . '/config/databaseConnexion.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    <?php require_once(__DIR__ . '/header.php'); ?>
    <?php require_once(__DIR__. '/body.php'); ?>
    <?php require_once(__DIR__. '/footer.php'); ?>
    <script src="script.js"></script>
</body>
</html>