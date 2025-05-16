{block name='customer_form'}
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: white;
      margin: 0;
      padding: 40px 20px;
    }

    .form-container {
      max-width: 600px;
      margin: auto;
    }

    h2 {
      text-align: center;
      font-weight: 800;
      font-size: 24px;
      color: #0d1b3d;
      margin-bottom: 8px;
    }

    .gradient-line {
      width: 300px;
      height: 10px;
      margin: 0 auto 40px auto;
      background: linear-gradient(to right, #f47b20, white);
      border-radius: 0px;
    }

    .card {
      border: none;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    .form-row {
      display: flex;
      justify-content: space-between;
      gap: 16px;
    }

    .form-row input {
      width: 100%;
    }

    .form-row .half {
      flex: 1;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="password"] {
      padding: 12px;
      border: 1px solid #ccc;
      width: 100%;
      font-size: 14px;
    }

    input::placeholder {
      color: #999;
    }

    .checkbox-group {
      display: flex;
      align-items: flex-start;
      gap: 8px;
      font-size: 14px;
      margin-top: 8px;
    }

    .checkbox-group input[type="checkbox"] {
      width: 16px;
      height: 16px;
      margin-top: 3px;
    }

    .page-header h1 {
      display: none;
    }

    .submit-btn {
      margin-top: 24px;
      padding: 14px;
      font-size: 14px;
      font-weight: bold;
      border: 2px solid #f47b20;
      background: transparent;
      color: #f47b20;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .submit-btn:hover {
      background: #f47b20;
      color: white;
    }

    label {
      color: #333;
    }
  </style>

  <div class="form-container">
    <h2>CRÉER VOTRE COMPTE</h2>
    <div class="gradient-line"></div>

    {block name='customer_form_errors'}
      {include file='_partials/form-errors.tpl' errors=$errors['']}
    {/block}

    <form action="{$action}" method="post" id="registerForm">
      <div class="form-row">
        <input class="half" type="text" name="lastname" placeholder="Nom *" required />
        <input class="half" type="text" name="firstname" placeholder="Prénom *" required />
      </div>

      <input type="text" name="boatName" placeholder="Nom du bateau / Société" />
      <input type="email" name="email" placeholder="Email *" required />
      <input type="tel" name="phone" placeholder="Téléphone *" required />
      <input type="text" name="address" placeholder="Adresse de facturation *" required />
      <input type="password" name="password" placeholder="Mot de passe *" required />
      <input type="password" name="confirmPassword" placeholder="Confirmer le mot de passe" required />

      <div class="checkbox-group">
        <input type="checkbox" id="acceptTerms" name="acceptTerms" required />
        <label for="acceptTerms">J'accepte les Conditions Générales de Vente (CGV) et la Politique de Confidentialité *</label>
      </div>

      <div class="checkbox-group">
        <input type="checkbox" id="newsletter" name="newsletter" />
        <label for="newsletter">Je souhaite m'inscrire à la Newsletter de Lyvio Marine</label>
      </div>

      <button class="submit-btn" type="submit">S'INSCRIRE</button>
    </form>
  </div>

  {* AJOUT DU SCRIPT POUR DÉSACTIVER LE HEADER FIXE *}
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      let header = document.querySelector("#header1");

      if (header) {
        console.log("📌 Page catégorie détectée ! Suppression du header fixe.");
        header.style.position = "relative";
        header.style.top = "0";
      }
    });
  </script>
{/block}
