{extends file='parent:frontend/custom/header.tpl'}

{block name='frontend_index_header_canonical'}{$sCustomPage.canonical_link}{/block}

{*block name='frontend_index_header_meta_tags' append*}
{block name='frontend_index_header_meta_tags' }
    {if $feed_type == 'user' || $feed_type == 'magazine' || $feed_type == 'story'}
        {$sCustomPage.meta_fb_app_id}
        {$sCustomPage.meta_og_url}
        {$sCustomPage.meta_og_title}
        {$sCustomPage.meta_og_type}
        {$sCustomPage.meta_og_image}
		{if $sCustomPage.meta_og_image_width}<meta property="og:image:width" content="{$sCustomPage.meta_og_image_width}" />{"\n"}{/if}
		{if $sCustomPage.meta_og_image_height}<meta property="og:image:height" content="{$sCustomPage.meta_og_image_height}" />{/if}
        {$sCustomPage.author}
    {/if}
		<meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

{* Newly added 151008 *}
{block name="frontend_index_header_favicons"}
{/block}

{block name='frontend_index_header_meta_tags_ie9'}
{/block}

{block name='frontend_index_header_meta_tags_android'}
{/block}
