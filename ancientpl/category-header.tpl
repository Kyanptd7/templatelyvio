{**
 * Copyright   PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright   PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<div id="js-product-list-header">
    {if $listing.pagination.items_shown_from == 1}
        <div class="block-category card card-block">
            <h1 class="h1">{$category.name}</h1>
            <div class="block-category-inner">
                {if isset($profile_params.c_config) && $profile_params.c_config.category_des != 1 && $category.description|count_characters > $profile_params.c_config.category_dleng}
                    {if $profile_params.c_config.category_des == 2}
                        <div id="category-description" class="readmore-wrap" class="text-muted">
                            <div class="less">
                                {$category.description|truncate:$profile_params.c_config.category_dleng:'...'|escape:'html':'UTF-8' nofilter}
                            </div>
                            <div class="more">
                                {$category.description|escape:'html':'UTF-8' nofilter}
                            </div>
                             <a class="readmore"  href="javascript:void(0)" data-more="{l s='Read More' d='Shop.Theme.Catalog'}" data-less="{l s='Read Less' d='Shop.Theme.Catalog'}">{l s='Read More' d='Shop.Theme.Catalog'}</a>
                        </div>
                    {/if}    
                {else}
                {if $category.description}
                    <div id="category-description" class="text-muted">{$category.description nofilter}</div>
                {/if}
                {/if}

                {if (isset($profile_params.c_config) && $profile_params.c_config.category_image == 1) || !isset($profile_params.c_config)}
                {if !empty($category.image.large.url)}
                    <div class="category-cover">
                        <img src="{$category.image.large.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" loading="lazy">
                    </div>
                {/if}
                {/if}
            </div>
        </div>
    {/if}
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