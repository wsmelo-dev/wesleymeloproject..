const items = document.querySelectorAll('section > *, .hero-copy, .hero-media');
items.forEach((el) => el.classList.add('reveal'));

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('in');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.12 });

items.forEach((el) => observer.observe(el));
