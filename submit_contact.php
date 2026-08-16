
<?php
session_start();
require_once(__DIR__ . '/config/mysql.php');
require_once(__DIR__ . '/config/databaseConnexion.php');
$postData = $_POST;

try {

    $nom = $postData['nomExpediteur'];
    $email = $postData['emailExpediteur'];
    $telephone = $postData['telephoneExpediteur'];
    $sujet = $postData['typeMessage'];  
    $messageEx = $postData['contenuMessage'];

    if (empty($nom) || empty($email) || empty($messageEx)) {
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(['success' => false, 'message' => 'Veuillez remplir tous les champs obligatoires.']);
        return;
    }
    
    $sql = 'INSERT INTO Message(nomExpediteur, emailExpediteur, telephoneExpediteur, typeMessage, contenuMessage, dateEnvoi, statut) VALUES(:nom, :email, :telephone, :sujet, :messageEx, :dateEnvoi, :statut) ';
    $preparedStatement = $mysqlClient->prepare($sql);
    $params = [
        'nom' => $nom,
        'email' => $email,
        'telephone' => $telephone,
        'sujet' => $sujet,
        'messageEx' => $messageEx,
        'dateEnvoi' => date('Y-m-d H:i:s'),
        'statut' => 'EN_ATTENTE',
    ];
    $preparedStatement->execute($params);
    $info = $preparedStatement->errorInfo();
    $affected = $preparedStatement->rowCount();
    header('Content-Type: application/json; charset=utf-8');
    if ($affected > 0) {
        echo json_encode(['success' => true, 'message' => 'Message envoyé avec succès ! Vous recevrez une réponse dans les plus brefs délais.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'L\'insertion n\'a affecté aucune ligne. Vérifiez la table Message et les permissions.']);
    }

} catch (PDOException $e) {
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['success' => false, 'message' => 'Erreur serveur PDO', 'error' => $e->getMessage()]);
    exit;
} catch (Exception $e) {
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['success' => false, 'message' => 'Erreur serveur', 'error' => $e->getMessage()]);
    exit;
}






?>