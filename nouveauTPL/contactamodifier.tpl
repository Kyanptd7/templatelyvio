{extends file='layouts/layout-full-width.tpl'}

{block name='content'}

<!-- GOOGLE MAPS -->
<div class="google-maps-container">
  <iframe 
    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2889.6838306205863!2d7.123664715737635!3d43.58000895750252!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12cdd53a6ff3f521%3A0x7cc94bf428b0a88d!2s4%20Av.%20Fr%C3%A9d%C3%A9ric%20Mistral%2C%2006600%20Antibes!5e0!3m2!1sfr!2sfr!4v1705425283248!5m2!1sfr!2sfr" 
    class="google-map"
    allowfullscreen
    loading="lazy"
    referrerpolicy="no-referrer-when-downgrade">
  </iframe>
</div>

<!-- DEUX COLONNES -->
<div class="contact-wrapper">
  <div class="contact-left">
    <div class="info-title-container">
      <h3>INFORMATIONS</h3>
    </div>
    <div class="custom-contact-info">
      {widget name="ps_contactinfo" hook='displayLeftColumn'}
    </div>
  </div>
  <div class="contact-right">
    <h3>CONTACTEZ NOUS</h3>
    {widget name="contactform"}
  </div>
</div>

<!-- TITRE HORAIRES -->
<div class="store-title-container">
  <h2>HORAIRE MAGASIN</h2>
</div>

<!-- HORAIRES -->
<div class="store-hours">
  <div class="line">LUNDI : 8H - 12H / 14H - 17H</div>
  <div class="line">MARDI : 8H - 12H / 14H - 17H</div>
  <div class="line">MERCREDI : 8H - 12H / 14H - 17H</div>
  <div class="line">JEUDI : 8H - 12H / 14H - 17H</div>
  <div class="line">VENDREDI : 8H - 12H / 14H - 17H</div>
</div>

<!-- STYLE CSS -->
<style>
  .google-maps-container {
    width: 100%;
    height: 450px;
    margin-bottom: 50px;
  }

  .google-map {
    width: 100%;
    height: 100%;
    border: none;
  }

  .contact-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    max-width: 1200px;
    margin: 60px auto;
    padding: 0 20px;
    gap: 60px;
  }

  .contact-left, .contact-right {
    width: 48%;
  }

  /* Titre INFORMATIONS avec dégradé orange vers blanc */
  .info-title-container h3 {
  font-size: 24px;
  color: #002f4b;
  margin: 0;
  font-family: Arial, sans-serif;
  font-weight: bold;
  text-align: left;
  margin-left: 40px;
}

  .info-title-container h3 {
    font-size: 24px;
    color: #002f4b;
    margin: 0;
    font-family: Arial, sans-serif;
    font-weight: bold;
  }

/* Dégradé de gauche (orange) à droite (blanc), toujours juste sous le titre */
.info-title-container::after {
  content: "";
  display: block;
  width: 35%;
  height: 12px;
  background: linear-gradient(to right, #f57c00, #ffffff);
  margin: -10px auto 0; /* marge vers le bas */
  border-radius: 0;
  margin-left: -5px;
}




  /* Infos magasin customisées */
  .custom-contact-info {
    border: none !important;
    box-shadow: none !important;
    font-size: 16px;
    color: #333;
    font-family: Arial, sans-serif;
    margin-top: 30px;
  }

  .custom-contact-info h4 {
    display: none;
  }

  .custom-contact-info li {
    list-style: none;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
    border: none !important;
  }

  .custom-contact-info i {
    color: #000 !important; /* icônes noires */
    font-size: 18px;
    min-width: 20px;
  }

  .custom-contact-info a {
    color: #f57c00 !important; /* orange pour email et tel */
    text-decoration: none;
  }

  .contact-right {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 4px;
  }

  .contact-right h3 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 25px;
    text-transform: uppercase;
    color: #222;
  }

  .contact-right form {
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  .contact-right input,
  .contact-right textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 2px;
    font-size: 14px;
  }

  .contact-right button,
  .contact-right input[type="submit"] {
    width: fit-content;
    margin-top: 10px;
    padding: 10px 30px;
    background-color: #fff;
    color: #f57c00;
    border: 2px solid #f57c00;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
  }

  .contact-right button:hover,
  .contact-right input[type="submit"]:hover {
    background-color: #f57c00;
    color: #fff;
  }

  /* TITRE HORAIRE MAGASIN */
  .store-title-container {
    background: linear-gradient(135deg, #002f4b, #006494);
    padding: 50px 0;
    text-align: center;
  }

  .store-title-container h2 {
    font-size: 28px;
    font-weight: bold;
    color: white;
    font-family: 'Arial', sans-serif;
    margin: 0;
  }

  /* Horaires simples */
  .store-hours {
    background-color: white;
    color: #002f4b;
    text-align: center;
    padding: 40px 20px;
    font-family: 'Arial', sans-serif;
    font-weight: 500;
    font-size: 18px;
  }

  .store-hours .line {
    margin: 15px 0;
  }
</style>

{/block}
