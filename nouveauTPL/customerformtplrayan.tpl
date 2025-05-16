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

  /* Messages d'erreur et confirmation */
  .alert {
    padding: 12px 20px;
    border-radius: 4px;
    margin-bottom: 20px;
  }
  .alert-danger {
    background-color: #f8d7da;
    color: #842029;
  }
  .alert-success {
    background-color: #d1e7dd;
    color: #0f5132;
  }
</style>

<div class="form-container">
  <h2>CRÉER VOTRE COMPTE</h2>
  <div class="gradient-line"></div>

  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  {if isset($confirmation) && $confirmation}
    <div class="alert alert-success">
      Votre compte a bien été créé et vous êtes connecté.
    </div>
  {/if}

  <form action="{block name='customer_form_actionurl'}{$action}{/block}" method="post" id="registerForm" novalidate>
    <div class="form-row">
      <input class="half" type="text" name="lastname" placeholder="Nom *" required value="{$fields.lastname|escape:'html':'UTF-8'}" />
      <input class="half" type="text" name="firstname" placeholder="Prénom *" required value="{$fields.firstname|escape:'html':'UTF-8'}" />
    </div>

    <section>
    {block "form_fields"}
      {assign var="i" value=0}
      {foreach from=$formFields item=field}
        {block "form_field"}

          {if $field.name === 'lastname' || $field.name === 'firstname'}
            {if $i == 0}<div class="form-row">{/if}
              <div class="half">{form_field field=$field}</div>
            {assign var="i" value=$i+1}
            {if $i == 2}</div>{/if}

          {elseif $field.name == 'password' || $field.name == 'password_confirmation'}
            <div class="form-row">
              <div class="half">{form_field field=$field}</div>
            </div>

          {elseif $field.type === 'checkbox' && ($field.name == 'newsletter' || $field.name == 'optin')}
            <div class="checkbox-group">{form_field field=$field}</div>

          {else}
            <div class="form-row">{form_field field=$field}</div>
          {/if}

        {/block}
      {/foreach}

      {$hook_create_account_form nofilter}
    {/block}
  </section>
  <style>
  /* Pour forcer les champs Bootstrap à ressembler à ton design */
.form-group.row {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 16px;
}

.form-control-label {
  font-weight: bold;
  margin-bottom: 4px;
  color: #333;
}

.form-control {
  padding: 12px;
  border: 1px solid #ccc;
  width: 100%;
  font-size: 14px;
  border-radius: 0;
  box-shadow: none;
}

.form-control:focus {
  border-color: #f47b20;
  outline: none;
}

.form-control-comment {
  font-size: 12px;
  color: #999;
  margin-top: 4px;
}

/* Cache les colonnes Bootstrap */
.col-md-3, .col-md-6 {
  flex: none;
  width: 100% !important;
  max-width: 100%;
}

/* Supprime la row Bootstrap */
.form-group.row {
  margin: 0;
  padding: 0;
}

  </style>
    <div class="checkbox-group">
      <input type="checkbox" id="acceptTerms" name="acceptTerms" required {if isset($fields.acceptTerms) && $fields.acceptTerms}checked{/if} />
      <label for="acceptTerms">J'accepte les Conditions Générales de Vente (CGV) et la Politique de Confidentialité *</label>
    </div>

    <div class="checkbox-group">
      <input type="checkbox" id="newsletter" name="newsletter" {if isset($fields.newsletter) && $fields.newsletter}checked{/if} />
      <label for="newsletter">Je souhaite m'inscrire à la Newsletter de Lyvio Marine</label>
    </div>

    <input type="hidden" name="submitCreate" value="1">
    
    <button class="submit-btn"  data-link-action="save-customer" type="submit">S'INSCRIRE</button>
  </form>
</div>

<script>
  // Ici tu peux ajouter un checker de force du mot de passe si tu veux, par ex. via zxcvbn.js (lib externe)
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
  let header = document.querySelector("#header1");
  if (header) {
    header.style.position = "relative";
    header.style.top = "0";
  }
});
</script>
{/block}
