// Mobile Navigation Toggle
document.addEventListener('DOMContentLoaded', function() {
  const menuToggle = document.querySelector('.mobile-menu-toggle');
  const siteNav = document.querySelector('.site-nav');

  if (menuToggle && siteNav) {
    menuToggle.addEventListener('click', function() {
      const isExpanded = this.getAttribute('aria-expanded') === 'true';
      this.setAttribute('aria-expanded', !isExpanded);
      siteNav.classList.toggle('active');
      document.body.style.overflow = !isExpanded ? 'hidden' : '';
    });

    // Close menu when clicking a link
    const navLinks = siteNav.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
      link.addEventListener('click', function() {
        menuToggle.setAttribute('aria-expanded', 'false');
        siteNav.classList.remove('active');
        document.body.style.overflow = '';
      });
    });
  }
});

// Lightbox for galleries (photography, project galleries)
document.addEventListener('DOMContentLoaded', function() {
  const triggers = document.querySelectorAll('.photo-item img, .project-gallery img.gallery-image');

  if (triggers.length === 0) return;

  const lightbox = document.createElement('div');
  lightbox.className = 'lightbox';
  lightbox.innerHTML = `
    <button class="lightbox-close" aria-label="Close lightbox">&times;</button>
    <div class="lightbox-content">
      <img src="" alt="">
    </div>
  `;
  document.body.appendChild(lightbox);

  const lightboxImg = lightbox.querySelector('img');
  const closeBtn = lightbox.querySelector('.lightbox-close');

  triggers.forEach(img => {
    img.addEventListener('click', function(e) {
      e.preventDefault();
      lightboxImg.src = this.src;
      lightboxImg.alt = this.alt;
      lightbox.classList.add('active');
      document.body.style.overflow = 'hidden';
    });
  });

  function closeLightbox() {
    lightbox.classList.remove('active');
    document.body.style.overflow = '';
  }

  closeBtn.addEventListener('click', closeLightbox);
  lightbox.addEventListener('click', function(e) {
    if (e.target === lightbox) closeLightbox();
  });
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && lightbox.classList.contains('active')) closeLightbox();
  });
});

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function(e) {
    const href = this.getAttribute('href');
    if (href !== '#') {
      e.preventDefault();
      const target = document.querySelector(href);
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    }
  });
});

// Add loaded class to body for CSS animations
document.addEventListener('DOMContentLoaded', function() {
  document.body.classList.add('loaded');
});
