<section class="hero" id="top">
  <div class="container hero-grid">
    <div>
      <div class="eyebrow"><?php echo __('hero_eyebrow'); ?></div>
        <h1>
          <span class="underline-wrap"><?php echo __('hero_h1_part1'); ?>
          <svg class="chalk-underline" viewBox="0 0 300 22" preserveAspectRatio="none">
            <path d="M4 14 C 80 4, 160 20, 296 8"/>
          </svg>
          </span>
          <?php echo __('hero_h1_part2'); ?>
      </h1>
        <p class="lead"><?php echo __('hero_lead'); ?></p>
      <div class="hero-ctas">
          <a href="#contact" class="btn btn-crayon"><?php echo __('hero_cta_1'); ?></a>
          <a href="#parcours" class="btn btn-ghost-light"><?php echo __('hero_cta_2'); ?></a>
      </div>
      <p class="hero-note">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 12c4-8 12-8 16 0" stroke-linecap="round"/><circle cx="12" cy="12" r="1.4" fill="currentColor" stroke="none"/></svg>
        <?php echo __('hero_note'); ?>
      </p>
    </div>
    <div class="hero-visual">
      <div class="chalk-card card-a">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M3 12l9-7 9 7-9 7-9-7z"/><path d="M7 14v5c0 1 2 2 5 2s5-1 5-2v-5"/></svg>
        <h4>
          <?php
            $sql = 'SELECT AVG(nombre_eleves) AS moyenne
            FROM (
                SELECT idClasse, COUNT(*) AS nombre_eleves
                FROM Eleve
                WHERE idClasse IS NOT NULL
                GROUP BY idClasse
            ) AS moyenne';
            $stmt = $mysqlClient->query($sql);
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row && isset($row['moyenne'])) {
            // round(..., 0) ou (int) pour garantir un nombre entier
            $moyenne = (int) round($row['moyenne']);
            echo $moyenne . ' élèves';
            }
          ?>
        </h4>
        <p>en moyenne par classe</p>
      </div>
      <div class="chalk-card card-b">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 3v18M4 8l8-5 8 5M4 16l8 5 8-5"/></svg>
        <h4>2 langues</h4>
        <p>français, anglais</p>
      </div>
      <div class="chalk-card card-c">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
        <h4>Depuis 1994</h4>
        <p>30 ans d'expérience</p>
      </div>
      <svg class="doodle-star" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M12 2l2.4 6.6L21 11l-6.6 2.4L12 20l-2.4-6.6L3 11l6.6-2.4z"/></svg>
      <svg class="doodle-arrow" viewBox="0 0 100 24" fill="none" stroke-width="1.5"><path d="M2 12h90M80 4l12 8-12 8"/></svg>
    </div>
  </div>
</section>

<div class="stats">
  <div class="container">
    <div class="stat"><div class="num">
      <?php
        $sql = 'SELECT COUNT(*) AS total FROM Eleve';
        $stmt = $mysqlClient->query($sql);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        echo $row['total'];
      ?>
    </div><div class="label">élèves accueillis</div></div>
    <div class="stat"><div class="num">
      <?php
        $sql = 'SELECT COUNT(*) AS total FROM Enseignant';
        $stmt = $mysqlClient->query($sql);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        echo $row['total'];
      ?>
    </div><div class="label">enseignants passionnés</div></div>
    <div class="stat"><div class="num">96%</div><div class="label">de réussite au brevet</div></div>
    <div class="stat"><div class="num">12</div><div class="label">ateliers hebdomadaires</div></div>
  </div>
</div>

<section id="parcours">
  <div class="container">
    <div class="section-head reveal">
      <div class="eyebrow"><?php echo __('section_parcours_eyebrow'); ?></div>
      <h2><?php echo __('section_parcours_h2'); ?></h2>
      <p><?php echo __('section_parcours_p'); ?></p>
    </div>
    <div class="folders">
      <div class="folder reveal">
        <span class="folder-tab">2 – 5 ans</span>
        <h3>Maternelle</h3>
        <div class="age">Éveil &amp; découverte</div>
        <p>Le jeu comme outil d'apprentissage : motricité, langage, premiers repères sociaux dans un cadre rassurant.</p>
        <ul>
          <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>Jardin pédagogique</li>
          <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>Ateliers sensoriels</li>
          <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>Sieste &amp; temps calme</li>
        </ul>
      </div>
      <div class="folder reveal">
        <span class="folder-tab">6 – 10 ans</span>
        <h3>Primaire</h3>
        <div class="age">Fondamentaux &amp; curiosité</div>
        <p>Lecture, écriture, calcul solidement ancrés, complétés par des projets qui donnent du sens aux apprentissages.</p>
        <ul>
          <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>Classes de 20 élèves max</li>
          <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>Anglais dès le CP</li>
          <li><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>Sorties nature mensuelles</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section id="cadre">
  <div class="container">
    <div class="section-head reveal">
      <div class="eyebrow"><?php echo __('section_cadre_eyebrow'); ?></div>
      <h2><?php echo __('section_cadre_h2'); ?></h2>
      <p><?php echo __('section_cadre_p'); ?></p>
    </div>
    <div class="photo-board reveal">
      <div class="photo-grid">
        <div class="photo-card">
          <span class="pin"></span>
          <div class="photo-placeholder">
            <img src="images/image2.jpg" alt="La cour de récréation" />
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="10" r="2"/><path d="M21 15l-5-5-6 6"/></svg>
          </div>
          <div class="caption">La cour de récréation</div>
        </div>
        <div class="photo-card">
          <span class="pin"></span>
          <div class="photo-placeholder">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="10" r="2"/><path d="M21 15l-5-5-6 6"/></svg>
            <img src="images/class1.jpg" alt="Une salle de classe" />
          </div>
          <div class="caption">
            Une salle de classe
          </div>
        </div>
        <div class="photo-card">
          <span class="pin"></span>
          <div class="photo-placeholder">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="10" r="2"/><path d="M21 15l-5-5-6 6"/></svg>
            <img src="images/jardin1.jpg" alt="Le jardin pédagogique" />
          </div>
          <div class="caption">Le jardin pédagogique</div>
        </div>
        <div class="photo-card">
          <span class="pin"></span>
          <div class="photo-placeholder">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="10" r="2"/><path d="M21 15l-5-5-6 6"/></svg>
            <img src="images/ecole.jpg" alt="La façade de l'école" />
          </div>
          <div class="caption">La façade de l'école</div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="equipe" style="background:var(--paper-light);">
  <div class="container">
    <div class="section-head reveal">
      <div class="eyebrow"><?php echo __('section_equipe_eyebrow'); ?></div>
      <h2><?php echo __('section_equipe_h2'); ?></h2>
      <p><?php echo __('section_equipe_p'); ?></p>
    </div>
    <div class="team-grid reveal">
      <div class="team-card">
        <div class="team-avatar">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-4.4 3.6-8 8-8s8 3.6 8 8"/></svg>
          <img src="images/enseign4.jpg" alt="Claire Fontaine, directrice de l'école" />
        </div>
        <h4>Claire Fontaine</h4>
        <div class="role"><?php echo __('team_1_role'); ?></div>
        <p class="bio"><?php echo __('team_1_bio'); ?></p>
      </div>
      <div class="team-card">
        <div class="team-avatar">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-4.4 3.6-8 8-8s8 3.6 8 8"/></svg>
          <img src="images/enseign1.png" alt="Karim Belaïd, enseignant" />
        </div>
        <h4>Karim Belaïd</h4>
        <div class="role"><?php echo __('team_2_role'); ?></div>
        <p class="bio"><?php echo __('team_2_bio'); ?></p>
      </div>
      <div class="team-card">
        <div class="team-avatar">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-4.4 3.6-8 8-8s8 3.6 8 8"/></svg>
          <img src="images/ensign3.png" alt="Léa Moreau, enseignante" />
        </div>
        <h4>Léa Moreau</h4>
        <div class="role"><?php echo __('team_3_role'); ?></div>
        <p class="bio"><?php echo __('team_3_bio'); ?></p>
      </div>
    </div>
  </div>
</section>

<section id="journee" style="background:var(--paper-light);">
  <div class="container">
    <div class="section-head reveal">
      <div class="eyebrow"><?php echo __('journee_eyebrow'); ?></div>
      <h2><?php echo __('journee_h2'); ?></h2>
      <p><?php echo __('journee_p'); ?></p>
    </div>
    <div class="timetable-wrap reveal">
      <div class="tt-row">
        <div class="tt-time"><?php echo __('journee_row_1_time'); ?></div>
        <div class="tt-info"><h4><?php echo __('journee_row_1_title'); ?></h4><p><?php echo __('journee_row_1_p'); ?></p></div>
        <div class="tt-tag">Vie de classe</div>
      </div>
      <div class="tt-row">
        <div class="tt-time"><?php echo __('journee_row_2_time'); ?></div>
        <div class="tt-info"><h4><?php echo __('journee_row_2_title'); ?></h4><p><?php echo __('journee_row_2_p'); ?></p></div>
        <div class="tt-tag">Fondamentaux</div>
      </div>
      <div class="tt-row">
        <div class="tt-time"><?php echo __('journee_row_3_time'); ?></div>
        <div class="tt-info"><h4><?php echo __('journee_row_3_title'); ?></h4><p><?php echo __('journee_row_3_p'); ?></p></div>
        <div class="tt-tag">Plein air</div>
      </div>
      <div class="tt-row">
        <div class="tt-time"><?php echo __('journee_row_4_time'); ?></div>
        <div class="tt-info"><h4><?php echo __('journee_row_4_title'); ?></h4><p><?php echo __('journee_row_4_p'); ?></p></div>
        <div class="tt-tag">Sciences</div>
      </div>
      <div class="tt-row">
        <div class="tt-time"><?php echo __('journee_row_5_time'); ?></div>
        <div class="tt-info"><h4><?php echo __('journee_row_5_title'); ?></h4><p><?php echo __('journee_row_5_p'); ?></p></div>
        <div class="tt-tag">Ateliers</div>
      </div>
    </div>
  </div>
</section>

<section id="pourquoi">
  <div class="container">
    <div class="section-head reveal">
        <div class="eyebrow"><?php echo __('section_pourquoi_eyebrow'); ?></div>
        <h2><?php echo __('section_pourquoi_h2'); ?></h2>
        <p><?php echo __('section_pourquoi_p'); ?></p>
      </div>
    <div class="features">
      <div class="feature reveal">
        <svg viewBox="0 0 24 24" fill="none" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
        <h4><?php echo __('feature_1_title'); ?></h4>
        <p><?php echo __('feature_1_p'); ?></p>
      </div>
      <div class="feature reveal">
        <svg viewBox="0 0 24 24" fill="none" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
        <h4><?php echo __('feature_2_title'); ?></h4>
        <p><?php echo __('feature_2_p'); ?></p>
      </div>
      <div class="feature reveal">
        <svg viewBox="0 0 24 24" fill="none" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2l3 7h7l-5.5 4.5L18.5 21 12 16.5 5.5 21l2-7.5L2 9h7z"/></svg>
        <h4><?php echo __('feature_3_title'); ?></h4>
        <p><?php echo __('feature_3_p'); ?></p>
      </div>
      <div class="feature reveal">
        <svg viewBox="0 0 24 24" fill="none" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4.5 8-11V5l-8-3-8 3v6c0 6.5 8 11 8 11z"/></svg>
        <h4><?php echo __('feature_4_title'); ?></h4>
        <p><?php echo __('feature_4_p'); ?></p>
      </div>
    </div>
  </div>
</section>

<section id="inscription" style="background:var(--paper-light);">
  <div class="container">
    <div class="section-head reveal">
      <div class="eyebrow"><?php echo __('section_inscription_eyebrow'); ?></div>
      <h2><?php echo __('section_inscription_h2'); ?></h2>
      <p><?php echo __('section_inscription_p'); ?></p>
    </div>
    <div class="steps-path reveal">
      <div class="steps-row">
        <div class="step">
          <div class="step-num">1</div>
          <h4><?php echo __('insc_step1_title'); ?></h4>
          <p><?php echo __('insc_step1_p'); ?></p>
        </div>
        <div class="step">
          <div class="step-num">2</div>
          <h4><?php echo __('insc_step2_title'); ?></h4>
          <p><?php echo __('insc_step2_p'); ?></p>
        </div>
        <div class="step">
          <div class="step-num">3</div>
          <h4><?php echo __('insc_step3_title'); ?></h4>
          <p><?php echo __('insc_step3_p'); ?></p>
        </div>
        <div class="step">
          <div class="step-num">4</div>
          <h4><?php echo __('insc_step4_title'); ?></h4>
          <p><?php echo __('insc_step4_p'); ?></p>
        </div>
        <div class="step">
          <div class="step-num">5</div>
          <h4><?php echo __('insc_step5_title'); ?></h4>
          <p><?php echo __('insc_step5_p'); ?></p>
        </div>
      </div>
    </div>
    <div class="hero-ctas reveal" style="margin-top:44px;">
      <a href="#contact" class="btn btn-crayon"><?php echo __('insc_cta_start'); ?></a>
      <a href="#" class="btn btn-outline-dark"><?php echo __('insc_cta_download'); ?></a>
    </div>
  </div>
</section>

<section class="notes-section" id="avis">
  <div class="container">
    <?php require_once(__DIR__ . '/comments_list.php'); ?>
  </div>
</section>

<section class="cta-banner" id="contact">
  <div class="container">
    <h2 class="reveal"><?php echo __('contact_heading'); ?></h2>
    <p class="reveal"><?php echo __('contact_p'); ?></p>
    <div class="hero-ctas reveal">
      <a href="tel:+237690326000" class="btn btn-ghost-light">690 32 60 00 </a>
      <a href="mailto:contact@ecole-horizon.fr" class="btn btn-ghost-light">contact@ecole-horizon.fr</a>
    </div>

    <div class="avis-form-wrap reveal" style="text-align:left;">
      <h3><?php echo __('contact_send_heading'); ?></h3>
      <p class="sub"><?php echo __('contact_sub'); ?></p>
        <?php require_once(__DIR__ . '/contact.php'); ?>
    </div>
  </div>
</section>