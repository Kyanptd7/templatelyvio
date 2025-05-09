<div id="js-product-list">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Helvetica Neue', sans-serif;
      background: #f9f9f9;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    .product-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 50px;
      max-width: 880px;
      width: 100%;
    }

    .product-card {
      background-color: white;
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      overflow: hidden;
      display: flex;
      flex-direction: column;
      height: 100%;
      position: relative;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding-bottom: 60px; /* pour laisser de la place au bouton */
    }

    .favorite-btn {
      position: absolute;
      top: 10px;
      right: 10px;
      background-color: rgba(0, 0, 0, 0.05);
      border: none;
      padding: 10px;
      border-radius: 50%;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .favorite-btn:hover {
      background-color: rgba(0, 0, 0, 0.1);
    }

    .product-image {
      height: 330px;
      overflow: hidden;
    }

    .product-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s;
    }

    .product-image img:hover {
      transform: scale(1.05);
    }

    .product-details {
      padding: 15px;
      flex-grow: 1;
      text-align: left; /* alignement à gauche */
    }

    .product-details h3 {
      font-size: 1rem;
      font-weight: normal;
      color: #1a1a1a;
      margin-bottom: 8px;
    }

    .product-details p {
      color: #777;
      font-size: 0.9rem;
      margin: 4px 0;
    }

    .product-details .price {
      margin-top: 8px;
      font-size: 1.3rem;
      font-weight: bold;
      color: #1a1a1a;
    }

    .add-to-cart-banner {
      position: absolute;
      bottom: 10px;
      left: 15px;
      right: 15px;
      background-color: #f58220;
      color: white;
      padding: 10px;
      border-radius: 5px;
      text-align: center;
      opacity: 0;
      transform: translateY(20px);
      transition: all 0.3s ease;
      pointer-events: none;
    }

    .product-card:hover .add-to-cart-banner {
      opacity: 1;
      transform: translateY(0);
      pointer-events: auto;
    }

    .pagination {
      display: flex;
      justify-content: center;
      margin-top: 40px;
      gap: 10px;
    }

    .pagination a,
    .pagination span {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      border: 1px solid #ccc;
      border-radius: 4px;
      text-decoration: none;
      color: #333;
      transition: background 0.3s;
    }

    .pagination .current {
      background-color: #f58220;
      color: white;
      border: none;
    }

    .pagination .disabled {
      pointer-events: none;
      background-color: #ddd;
      color: #999;
    }
  </style>

  <div class="product-grid">
    {foreach from=$listing.products item=product}
      <div class="product-card">
        <div class="action-btns">
          <button class="favorite-btn" aria-label="Ajouter aux favoris">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 1 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
            </svg>
          </button>
        </div>

        <div class="product-image">
          <a href="{$product.url}">
            <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name|escape:'html':'UTF-8'}">
          </a>
        </div>

        <div class="product-details">
          <h3>{$product.name|escape:'html':'UTF-8'}</h3>
          <p><span style="color:#999; font-size: 0.9rem;"><strong>Ref :</strong> {$product.reference}</span></p>
          <p class="price">{$product.price}</p>
        </div>

        <!-- Formulaire pour ajouter au panier sans rediriger -->
        <div class="add-to-cart-banner">
          <form method="post" action="{$link->getPageLink('cart', true)}" class="add-to-cart-form">
            <input type="hidden" name="add" value="1">
            <input type="hidden" name="token" value="{$static_token}">
            <input type="hidden" name="id_product" value="{$product.id_product}">
            <input type="hidden" name="id_customization" value="0">
            <button type="submit" style="background: none; border: none; color: white; cursor: pointer;">
              Ajouter au panier
            </button>
          </form>
        </div>
      </div>
    {/foreach}
  </div>

  {block name='pagination'}
    <div class="pagination">
      {if $listing.pagination.pages_count > 1}
        <span class="{if !$listing.pagination.previous}disabled{/if}">
          {if $listing.pagination.previous}
            <a href="{$listing.pagination.previous.url}">&#x276E;</a>
          {else}
            <span>&#x276E;</span>
          {/if}
        </span>

        {foreach from=$listing.pagination.pages item=page}
          {if $page.current}
            <span class="current">{$page.page}</span>
          {else}
            <a href="{$page.url}">{$page.page}</a>
          {/if}
        {/foreach}

        <span class="{if !$listing.pagination.next}disabled{/if}">
          {if $listing.pagination.next}
            <a href="{$listing.pagination.next.url}">&#x276F;</a>
          {else}
            <span>&#x276F;</span>
          {/if}
        </span>
      {/if}
    </div>
  {/block}
</div>
