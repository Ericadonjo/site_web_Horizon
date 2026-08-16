// header solid on scroll
  const header = document.getElementById('siteHeader');
  const onScroll = () => header.classList.toggle('solid', window.scrollY > 40);
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });

  // mobile nav toggle
  const navToggle = document.getElementById('navToggle');
  const mainNav = document.getElementById('mainNav');
  navToggle.addEventListener('click', () => {
    mainNav.classList.toggle('open');
  });
  mainNav.querySelectorAll('a').forEach(a => a.addEventListener('click', () => mainNav.classList.remove('open')));

  // star rating
  let selectedStars = 0;
  const starButtons = document.querySelectorAll('#starRating button');
  starButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      selectedStars = parseInt(btn.dataset.value, 10);
      starButtons.forEach(b => b.classList.toggle('active', parseInt(b.dataset.value, 10) <= selectedStars));
    });
  });

  // contact form (demo only — no backend wired up yet)
  const contactForm = document.getElementById('contactForm');
  if (contactForm) {
    contactForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const nom = document.getElementById('ctNom');
      const email = document.getElementById('ctEmail');
      const message = document.getElementById('ctMessage');
      const msg = document.getElementById('ctMsg');
      const errNom = document.getElementById('ctErrNom');
      const errEmail = document.getElementById('ctErrEmail');
      const errMessage = document.getElementById('ctErrMessage');
      const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

      let valid = true;
      if (!nom.value.trim()) { errNom.classList.add('show'); valid = false; } else { errNom.classList.remove('show'); }
      if (!emailPattern.test(email.value.trim())) { errEmail.classList.add('show'); valid = false; } else { errEmail.classList.remove('show'); }
      if (!message.value.trim()) { errMessage.classList.add('show'); valid = false; } else { errMessage.classList.remove('show'); }

      if (!valid) {
        msg.textContent = '';
        msg.className = 'form-msg';
        return;
      }

      // submit via fetch to the form action (or fallback to submit_contact.php)
      try {
        const formData = new FormData(contactForm);
        const action = contactForm.getAttribute('action') || 'submit_contact.php';
        const res = await fetch(action, {
          method: 'POST',
          body: formData,
          headers: {
            'Accept': 'application/json'
          }
        });
        const data = await res.json().catch(() => null);
        if (res.ok && data && data.success) {
          contactForm.reset();
          msg.textContent = data.message || 'Merci, votre message a bien été envoyé.';
          msg.className = 'form-msg success';
        } else {
          const errorMsg = data && data.message ? data.message : 'Une erreur est survenue lors de l\'envoi.';
          msg.textContent = errorMsg;
          msg.className = 'form-msg error';
        }
      } catch (err) {
        msg.textContent = 'Erreur réseau — impossible de contacter le serveur.';
        msg.className = 'form-msg error';
      }
    });
  }

  // review submission (demo only — stores nothing, needs a backend to persist)
  const avisForm = document.getElementById('avisForm');
  const notesGrid = document.querySelector('.notes-grid');
  const rotations = ['-3deg', '2deg', '-1.5deg', '2.5deg', '-2deg'];
  if (avisForm) {
    avisForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const nomInput = document.getElementById('avisNom');
      const classeInput = document.getElementById('avisClasse');
      const texteInput = document.getElementById('avisTexte');
      const msg = document.getElementById('avisMsg');
      const errNom = document.getElementById('errNom');
      const errTexte = document.getElementById('errTexte');

      let valid = true;
      if (!nomInput.value.trim()) { errNom.classList.add('show'); valid = false; } else { errNom.classList.remove('show'); }
      if (!texteInput.value.trim()) { errTexte.classList.add('show'); valid = false; } else { errTexte.classList.remove('show'); }

      if (!valid) {
        msg.textContent = '';
        msg.className = 'form-msg';
        return;
      }

      const note = document.createElement('div');
      note.className = 'note reveal in';
      note.style.transform = `rotate(${rotations[Math.floor(Math.random() * rotations.length)]})`;
      const stars = selectedStars > 0 ? ' ' + '★'.repeat(selectedStars) : '';
      const classe = classeInput.value.trim();
      note.innerHTML = `« ${texteInput.value.trim()} »${stars}<span class="who">— ${nomInput.value.trim()}${classe ? ', parent d\'un(e) élève de ' + classe : ''}</span>`;
      if (notesGrid) notesGrid.prepend(note);

      avisForm.reset();
      selectedStars = 0;
      starButtons.forEach(b => b.classList.remove('active'));
      msg.textContent = 'Merci ! Votre avis a été ajouté (en attente de modération avant mise en ligne définitive).';
      msg.className = 'form-msg success';
    });
  }

  // scroll reveal
  const io = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('in');
        io.unobserve(e.target);
      }
    });
  }, { threshold: 0.15 });
  document.querySelectorAll('.reveal').forEach(el => io.observe(el));