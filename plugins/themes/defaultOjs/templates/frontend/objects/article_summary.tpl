{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Tampilan ringkasan Artikel di dalam daftar artikel (List).
 * REVISI: Halaman, Views, dan Total Download sejajar di atas tombol PDF.
 *}
{assign var=publication value=$article->getCurrentPublication()}
{assign var=articlePath value=$publication->getData('urlPath')|default:$article->getId()}

{if !$heading}
	{assign var="heading" value="h2"}
{/if}

{if (!$section.hideAuthor && $publication->getData('hideAuthor') == \APP\submission\Submission::AUTHOR_TOC_DEFAULT) || $publication->getData('hideAuthor') == \APP\submission\Submission::AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="obj_article_summary">
	
	{* 1. COVER IMAGE (Opsional) *}
	{if $publication->getLocalizedData('coverImage')}
		<div class="cover">
			<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="file">
				{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
				<img
					src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
					alt="{$coverImage.altText|escape|default:''}"
				>
			</a>
		</div>
	{/if}

	{* 2. JUDUL ARTIKEL *}
	<{$heading} class="title">
		<a id="article-{$article->getId()}" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
			{if $currentContext}
				{$publication->getLocalizedTitle(null, 'html')|strip_unsafe_html}
				{assign var=localizedSubtitle value=$publication->getLocalizedSubtitle(null, 'html')|strip_unsafe_html}
				{if $localizedSubtitle}
					<span class="subtitle">{$localizedSubtitle}</span>
				{/if}
			{else}
				{$publication->getLocalizedFullTitle(null, 'html')|strip_unsafe_html}
				<span class="subtitle">
					{$journal->getLocalizedName()|escape}
				</span>
			{/if}
		</a>
	</{$heading}>

	{* 3. PENULIS (AUTHORS) *}
	{if $showAuthor}
		<div class="authors">
			{$publication->getAuthorString($authorUserGroups)|escape}
		</div>
	{/if}

	{* ================================================================== *}
	{* 4. BARIS INFORMASI (Halaman, Views, Download) *}
	
	{* Hitung total download *}
	{assign var=totalDownloads value=0}
	{foreach from=$article->getGalleys() item=galley}
		{assign var=totalDownloads value=$totalDownloads+$galley->getViews()}
	{/foreach}

	<div class="info-tambahan">
		
		{* A. Halaman (Pages) *}
		{if $publication->getData('pages')}
			<div class="item-info pages">
				<span class="fa fa-file-text-o"></span>
				<span>Hal. {$publication->getData('pages')|escape}</span>
			</div>
		{/if}

		{* B. Statistik VIEWS *}
		<div class="item-info stats-views">
			<span class="fa fa-eye"></span>
			<span>{$article->getViews()|default:0} Views</span>
		</div>

		{* C. Statistik DOWNLOADS (Total) *}
		<div class="item-info stats-downloads">
			<span class="fa fa-download"></span>
			<span>{$totalDownloads|default:0} Downloads</span>
		</div>

	</div>
	{* ================================================================== *}

	{* 5. TOMBOL PDF/GALLEY *}
	{if !$hideGalleys}
		<ul class="galleys_links">
			{foreach from=$article->getGalleys() item=galley}
				{if $primaryGenreIds}
					{assign var="file" value=$galley->getFile()}
					{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
						{continue}
					{/if}
				{/if}
				<li>
					{assign var="hasArticleAccess" value=$hasAccess}
					{if $currentContext->getSetting('publishingMode') == \APP\journal\Journal::PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == \APP\submission\Submission::ARTICLE_ACCESS_OPEN}
						{assign var="hasArticleAccess" value=1}
					{/if}
					{assign var="id" value="article-{$article->getId()}-galley-{$galley->getId()}"}
					
					{* Load Tombol PDF *}
					{include file="frontend/objects/galley_link.tpl" parent=$article publication=$publication id=$id labelledBy="{$id} article-{$article->getId()}" hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
					
				</li>
			{/foreach}
		</ul>
	{/if}

	{call_hook name="Templates::Issue::Issue::Article"}
</div>