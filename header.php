<?php require_once(__DIR__ . '/i18n.php'); ?>
<header id="siteHeader">
  <div class="container">
    <a href="#top" class="logo">
      <svg class="logo-mark" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M20 6 L36 14 L20 22 L4 14 Z" fill="#DFA23A"/>
        <path d="M11 17.5V27C11 27 14 31 20 31C26 31 29 27 29 27V17.5" stroke="#F4F1E4" stroke-width="2" fill="none"/>
      </svg>
      <?php echo __('site_name', 'École Horizon'); ?>
    </a>
    <nav class="main-nav" id="mainNav">
      <a href="#parcours"><?php echo __('nav_parcours'); ?></a>
      <a href="#cadre"><?php echo __('nav_cadre'); ?></a>
      <a href="#equipe"><?php echo __('nav_equipe'); ?></a>
      <a href="#pourquoi"><?php echo __('nav_admission'); ?></a>
      <a href="#avis"><?php echo __('nav_avis'); ?></a>
      <a href="#inscription"><?php echo __('nav_inscription'); ?></a>
      <a href="#contact" class="btn btn-crayon"><?php echo __('nav_contact'); ?></a>
    </nav>
    <button class="nav-toggle" id="navToggle" aria-label="Ouvrir le menu">
      <span></span><span></span><span></span>
    </button>
    <?php
      // Build current URL and replace/add lang parameter
      $current = $_SERVER['REQUEST_URI'] ?? '/';
      $parts = parse_url($current);
      $qs = [];
      if (isset($parts['query'])) parse_str($parts['query'], $qs);
      $qs_fr = $qs; $qs_fr['lang'] = 'fr';
      $qs_en = $qs; $qs_en['lang'] = 'en';
      $url_fr = ($parts['path'] ?? '/') . '?' . http_build_query($qs_fr);
      $url_en = ($parts['path'] ?? '/') . '?' . http_build_query($qs_en);
    ?>
    <div style="margin-left:12px; display:inline-block;">
      <a href="<?php echo htmlspecialchars($url_fr); ?>" aria-label="Français" style="margin-right:8px; text-decoration:none;">🇫🇷</a>
      <a href="<?php echo htmlspecialchars($url_en); ?>" aria-label="English" style="text-decoration:none;">🇬🇧</a>
    </div>
  </div>
</header>