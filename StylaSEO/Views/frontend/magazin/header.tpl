{extends file='parent:frontend/custom/header.tpl'}

{* Page title *}
{* if $sCustomPage.page_title}{block name='frontend_index_header_title'}{$sCustomPage.page_title}{/block}{/if *}

{* Description *}
{if $sCustomPage.meta_description}{block name='frontend_index_header_meta_description'}asdfadsf{$sCustomPage.meta_description}{/block}{/if}

{* Metatags *}
{block name='frontend_index_header_meta_tags' append}
		{if $feed_type == 'user' || $feed_type == 'magazine' || $feed_type == 'story' || $feed_type == 'tag'}
				{$sCustomPage.head_content}
		{/if}
{/block}

{if $sCustomPage.meta_keywords}{block name='frontend_index_header_meta_keywords'}{$sCustomPage.meta_keywords}{/block}{/if}

{* Newly added 151008 *}
{block name="frontend_index_header_favicons"}{/block}
{block name='frontend_index_header_meta_tags_ie9'}{/block}
{block name='frontend_index_header_meta_tags_android'}{/block}
