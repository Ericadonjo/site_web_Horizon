<?php
require_once(__DIR__ . '/config/mysql.php');
require_once(__DIR__ . '/config/databaseConnexion.php');

header('Content-Type: application/json');
try {
    $counts = [];
    $stmt = $mysqlClient->query("SELECT statut, COUNT(*) AS c FROM Avis GROUP BY statut");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($rows as $r) {
        $counts[$r['statut']] = (int)$r['c'];
    }

    $stmt2 = $mysqlClient->prepare("SELECT idAvis, nomAuteur, texte, note, statut, datePublication FROM Avis WHERE statut='VALIDE' ORDER BY datePublication DESC LIMIT 50");
    $stmt2->execute();
    $vals = $stmt2->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['counts' => $counts, 'valide' => $vals], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>