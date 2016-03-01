{* Constants for the different basket item types *}
{$IS_PRODUCT = 0}
{$IS_PREMIUM_PRODUCT = 1}
{$IS_VOUCHER = 2}
{$IS_REBATE = 3}
{$IS_SURCHARGE_DISCOUNT = 4}

{if $sBasketItem.additional_details.sConfigurator}
    {$detailLink={url controller=detail sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber}}
{else}
    {$detailLink=$sBasketItem.linkDetails}
{/if}

<div class="cart--item{if $basketItem.modus == 1} is--premium-article{elseif $basketItem.modus == 10} is--bundle-article{/if}">
    {* Article image *}
	{block name='frontend_checkout_ajax_cart_articleimage'}
		<div class="thumbnail--container{if $basketItem.image.thumbnails[0]} has--image{/if}">

            {* Real product *}
            {block name='frontend_checkout_ajax_cart_articleimage_product'}
                {if $basketItem.modus == $IS_PRODUCT || $basketItem.modus == $IS_PREMIUM_PRODUCT}
                    {if $basketItem.additional_details.image.thumbnails}
                        <img srcset="{$basketItem.additional_details.image.thumbnails[0].sourceSet}" alt="{$basketItem.articlename|escape}" class="thumbnail--image" />

                    {elseif $basketItem.image.src.0}
                        <img src="{$basketItem.image.src.0}" alt="{$basketItem.articlename|escape}" class="thumbnail--image" />
                    {/if}
                {/if}
            {/block}

            {* Premium article product badge *}
            {block name='frontend_checkout_ajax_cart_articleimage_badge_premium'}
                {if $basketItem.modus == $IS_PREMIUM_PRODUCT}
                    <span class="cart--badge">
                        <span class="badge--free">{s name='AjaxCartInfoFree' namespace="frontend/checkout/ajax_cart"}{/s}</span>
                    </span>
                {/if}
            {/block}

            {* Cart surcharge discount *}
            {block name='frontend_checkout_ajax_cart_articleimage_badge_surcharge'}
                {if $basketItem.modus == $IS_SURCHARGE_DISCOUNT}
                    <div class="basket--badge">
                        {if $sBasketItem.price >= 0}
                            <i class="icon--arrow-right"></i>
                        {else}
                            <i class="icon--percent2"></i>
                        {/if}
                    </div>
                {/if}
            {/block}

            {* Voucher *}
            {block name='frontend_checkout_ajax_cart_articleimage_badge_voucher'}
                {if $basketItem.modus == $IS_VOUCHER}
                    <div class="basket--badge">
                        <i class="icon--coupon"></i>
                    </div>
                {/if}
            {/block}

            {* Rebate article *}
            {block name='frontend_checkout_ajax_cart_articleimage_badge_rebate'}
                {if $basketItem.modus == $IS_REBATE}
                    <div class="basket--badge">
                        {if $sBasketItem.price >= 0}
                            <i class="icon--arrow-right"></i>
                        {else}
                            <i class="icon--percent2"></i>
                        {/if}
                    </div>
                {/if}
            {/block}
		</div>
	{/block}

    {* Article actions *}
    {block name='frontend_checkout_ajax_cart_actions'}
        <div class="action--container">
            {if $basketItem.modus != 4}
                <a href="{url controller="checkout" action='deleteArticle' sDelete=$basketItem.id}" class="btn is--small action--remove" title="{s name="AjaxCartRemoveArticle" namespace="frontend/checkout/ajax_cart"}{/s}">
                    X
                </a>
            {/if}
        </div>
    {/block}

    {* Article name *}
    {block name='frontend_checkout_ajax_cart_articlename'}
        <a class="item--link" href="{if $basketItem.modus != 4}{$detailLink}{else}#{/if}" title="{$basketItem.articlename|escape}">
            {block name="frontend_checkout_ajax_cart_articlename_quantity"}
				<span class="item--quantity">{$basketItem.quantity}x</span>
			{/block}
			{block name="frontend_checkout_ajax_cart_articlename_name"}
				<span class="item--name">
					{if $basketItem.modus == 10}
						{s name='AjaxCartInfoBundle' namespace="frontend/checkout/ajax_cart"}{/s}
					{else}
						{if $theme.offcanvasCart}
							{$basketItem.articlename}
						{else}
							{$basketItem.articlename|truncate:28:"...":true}
						{/if}
					{/if}
				</span>
			{/block}
			{block name="frontend_checkout_ajax_cart_articlename_price"}
				<span class="item--price">{if $basketItem.amount}{$basketItem.amount|currency}{else}{s name="AjaxCartInfoFree" namespace="frontend/checkout/ajax_cart"}{/s}{/if}*</span>
			{/block}
		</a>
    {/block}
</div>