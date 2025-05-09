  {if !empty($subcategories)}
    <style>
      .carousel-container {
        position: relative;
        overflow: hidden;
        width: 100%;
        margin: 20px 0;
      }

      .carousel-slides {
        display: flex;
        transition: transform 0.5s ease;
        gap: 16px;
      }

      .slide {
        flex: 0 0 calc((100% - 32px) / 3);
        padding: 12px;
        background: #fff;
        border: 1px solid #ccc;
        border-radius: 4px;
        text-align: center;
        font-size: 14px;
        font-weight: normal;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        box-sizing: border-box;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.3s ease;
      }

      .slide:hover {
        background-color: #f97316;
        color: white;
        transform: translateY(-4px);
      }

      .arrow {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: #ea8024;
    color: white;
    border: none;
    width: 36px;
    height: 36px;
    font-size: 16px;
    line-height: 36px;
    text-align: center;
    cursor: pointer;
    border-radius: 50%;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
  }


      .arrow.left { left: 0; }
      .arrow.right { right: 0; }

      .dots {
        display: flex;
        justify-content: center;
        margin-top: 10px;
        gap: 8px;
      }

      .dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background: #ccc;
        cursor: pointer;
      }

      .dot.active {
        background: #ea8024;
      }
    </style>

    <div class="carousel-container">
      <div class="carousel-slides" id="carouselSlides">
        {foreach from=$subcategories item=subcategory}
          <div class="slide">
            <a href="{$subcategory.url}" style="text-decoration:none; color:inherit;">
              {$subcategory.name|escape:'html':'UTF-8'}
            </a>
          </div>
        {/foreach}
      </div>

      <button class="arrow left" id="prevBtn">&#10094;</button>
      <button class="arrow right" id="nextBtn">&#10095;</button>

      <div class="dots" id="dotsContainer"></div>
    </div>

    {literal}
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const slidesContainer = document.getElementById('carouselSlides');
        const prevBtn = document.getElementById('prevBtn');
        const nextBtn = document.getElementById('nextBtn');
        const dotsContainer = document.getElementById('dotsContainer');

        const slides = slidesContainer.querySelectorAll('.slide');
        const slidesPerView = 3;
        const totalGroups = Math.ceil(slides.length / slidesPerView);
        let currentIndex = 0;

        function updateCarousel() {
          const slideWidth = slides[0].offsetWidth + 16;
          slidesContainer.style.transform = `translateX(-${currentIndex * slideWidth * slidesPerView}px)`;
          updateDots();
          prevBtn.style.display = currentIndex === 0 ? 'none' : 'block';
          nextBtn.style.display = currentIndex >= totalGroups - 1 ? 'none' : 'block';
        }

        function updateDots() {
          dotsContainer.innerHTML = '';
          for (let i = 0; i < totalGroups; i++) {
            const dot = document.createElement('div');
            dot.classList.add('dot');
            if (i === currentIndex) dot.classList.add('active');
            dot.addEventListener('click', () => {
              currentIndex = i;
              updateCarousel();
            });
            dotsContainer.appendChild(dot);
          }
        }

        nextBtn.addEventListener('click', () => {
          if (currentIndex < totalGroups - 1) {
            currentIndex++;
            updateCarousel();
          }
        });

        prevBtn.addEventListener('click', () => {
          if (currentIndex > 0) {
            currentIndex--;
            updateCarousel();
          }
        });

        window.addEventListener('resize', updateCarousel);
        updateCarousel();
      });
    </script>
    {/literal}
  {/if}
