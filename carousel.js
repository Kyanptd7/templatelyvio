document.addEventListener('DOMContentLoaded', () => {
    const carousel = document.getElementById('carousel-gianneschi');
    const track = carousel.querySelector('.carousel-track');
    const prevBtn = carousel.querySelector('.prev');
    const nextBtn = carousel.querySelector('.next');
  
    let index = 0;
  
    nextBtn.addEventListener('click', () => {
      index = (index + 1) % track.children.length;
      updateCarousel();
    });
  
    prevBtn.addEventListener('click', () => {
      index = (index - 1 + track.children.length) % track.children.length;
      updateCarousel();
    });
  
    function updateCarousel() {
      const offset = index * -220; // 200px + 20px margin
      track.style.transform = `translateX(${offset}px)`;
    }
  });
  