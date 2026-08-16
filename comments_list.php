<?php
// Fetch and render validated reviews from the `Avis` table
require_once(__DIR__ . '/config/mysql.php');
require_once(__DIR__ . '/config/databaseConnexion.php');

try {
    $stmt = $mysqlClient->prepare("SELECT idAvis, nomAuteur, texte, note, statut, datePublication, idParent FROM Avis WHERE statut = 'VALIDE' OR statut = 'APPROUVE' ORDER BY datePublication DESC");
    $stmt->execute();
    $avis = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (Exception $e) {
    $avis = [];
}

?>
    <div class="section-head reveal">
      <div class="eyebrow"><?php echo __('nav_avis', 'Avis'); ?></div>
      <h2><?php echo __('comments_h2', 'Des mots de parents, pas de slogans'); ?></h2>
      <p><?php echo __('comments_p', 'Quelques avis récents de parents de l\'école.'); ?></p>
    </div>
    <div class="notes-grid">
<?php if (!empty($avis)): ?>
  <?php foreach ($avis as $a): ?>
    <div class="note reveal">
      <?php echo htmlspecialchars($a['texte'], ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); ?>
      <span class="who">— <?php echo htmlspecialchars($a['nomAuteur'], ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); ?><?php if (!empty($a['note'])): ?> — <?php echo str_repeat('★', (int)$a['note']); ?><?php endif; ?></span>
    </div>
  <?php endforeach; ?>
<?php else: ?>
    <p>Aucun avis publié pour l'instant.</p>
<?php endif; ?>
    </div>
