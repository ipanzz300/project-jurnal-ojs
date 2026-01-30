{**
 * Templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 * is set from the plugin which initiates the page.
 *}

{* Determine whether a logo or title string is being displayed *}
{strip}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

<div class="pkp_structure_page">
	<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
		{include file="frontend/components/skipLinks.tpl"}

		{* TOP BAR BIRU (Hanya Menu User/Admin di sini) *}
		<div class="top-simple-bar">
		    <div class="top-simple-content">
		        <div class="top-bar-right-group">
		            <div class="top-user-menu-wrapper">
		                {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
		            </div>
		        </div>
		    </div>
		</div>

		<div class="pkp_head_wrapper">
			<div class="pkp_site_name_wrapper">
				<button class="pkp_site_nav_toggle">
					<span>{translate key="common.navigation.toggle"}</span>
				</button>

				<div class="pkp_site_name">
    {capture assign="homeUrl"}{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}{/capture}
    
    <div class="branding-wrapper">
        
        {* === [FIX] BAGIAN INISIAL OTOMATIS === *}
        <div class="journal-icon-box">
            {if $currentContext}
                {* Ambil Variable Nama dan Akronim *}
                {assign var="journalName" value=$currentContext->getLocalizedName()}
                {assign var="journalAcronym" value=$currentContext->getLocalizedAcronym()}
                
                {* LOGIKA: Prioritas Akronim -> Jika kosong, ambil huruf depan *}
                {if $journalAcronym}
                    {$journalAcronym|escape}
                {else}
                    {* Fallback: Ambil Huruf Pertama dari Kata Pertama & Kedua (Misal: Jurnal Teknologi -> JT) *}
                    {$journalName|regex_replace:"/(\b\w)\w+\s?/":"$1"|replace:" ":""|truncate:2:""|upper|escape}
                {/if}
            {else}
                {* Default jika bukan halaman jurnal *}
                OJS
            {/if}
        </div>

        <div class="journal-details">
            {if $displayPageHeaderTitle}
                <a href="{$homeUrl}" class="custom-journal-title">{$displayPageHeaderTitle|escape}</a>
            {else}
                <a href="{$homeUrl}" class="custom-journal-title">{$currentContext->getLocalizedName()|escape}</a>
            {/if}
            
            {if $currentContext}
                <div class="custom-issn-row">
                    {if $currentContext->getData('onlineIssn')}E-ISSN: {$currentContext->getData('onlineIssn')|escape}{/if}
                    {if $currentContext->getData('onlineIssn') && $currentContext->getData('printIssn')} | {/if}
                    {if $currentContext->getData('printIssn')}P-ISSN: {$currentContext->getData('printIssn')|escape}{/if}
                </div>
            {/if}
        </div>
    </div>
</div>

			{* NAVIGASI UTAMA (Tanpa Menu User agar tidak double) *}
			<nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
				<div class="pkp_navigation_primary_row">
					<div class="pkp_navigation_primary_wrapper">
						{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}

						{if $currentContext && $requestedPage !== 'search'}
							<div class="pkp_navigation_search_wrapper">
								<a href="{url page="search"}" class="pkp_search pkp_search_desktop">
									<span class="fa fa-search"></span> {translate key="common.search"}
								</a>
							</div>
						{/if}
					</div>
				</div>
			</nav>
		</div>
	</header>

	{if $isFullWidth}
		{assign var=hasSidebar value=0}
	{/if}