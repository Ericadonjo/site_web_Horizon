<?php
require_once(__DIR__ . '/config/mysql.php');
require_once(__DIR__ . '/config/databaseConnexion.php');

try {
    $counts = [];
    $stmt = $mysqlClient->query("SELECT statut, COUNT(*) AS c FROM Avis GROUP BY statut");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($rows as $r) {
        $counts[$r['statut']] = $r['c'];
    }
    echo "Counts by statut:\n";
    foreach ($counts as $s => $c) {
        echo "$s: $c\n";
    }

    echo "\nLatest 20 VALIDE rows:\n";
    $stmt2 = $mysqlClient->prepare("SELECT idAvis, nomAuteur, texte, note, statut, datePublication FROM Avis WHERE statut='VALIDE' ORDER BY datePublication DESC LIMIT 20");
    $stmt2->execute();
    $vals = $stmt2->fetchAll(PDO::FETCH_ASSOC);
    foreach ($vals as $v) {
        echo sprintf("%d | %s | %s | %s | %s\n", $v['idAvis'], $v['nomAuteur'], substr($v['texte'],0,50), $v['note'], $v['datePublication']);
    }
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage() . PHP_EOL;
}
?>