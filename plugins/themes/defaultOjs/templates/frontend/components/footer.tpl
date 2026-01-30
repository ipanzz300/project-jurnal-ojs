{**
 * templates/frontend/components/footer.tpl
 *
 *}

	</div>

	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary">
				{$sidebarCode}
			</div>
		{/if}
	{/if}

</div>{* Akhir dari pkp_structure_body *}


<div class="custom-footer-wrapper" role="contentinfo">
    <div class="custom-footer-container">

        <div class="footer_brand_top">
            <a href="{url page="about" op="aboutThisPublishingSystem"}" target="_blank">
                <img alt="Platform & workflow by OJS / PKP" 
                     src="{$baseUrl}/templates/images/ojs_brand_white.png" 
                     style="max-width: 150px; opacity: 1; filter: brightness(0) invert(1);">
            </a>
        </div>

        {* Baris Kolom Informasi *}
        <div class="footer-top-row">
            
            {* KOLOM 1: Branding Jurnal *}
            <div class="footer-col branding-col">
                <div class="journal-icon-box" style="margin-bottom: 20px;">
                    {if $currentContext}
                        {assign var="acronym" value=$currentContext->getLocalizedAcronym()}
                        {if $acronym}
                            {$acronym|escape}
                        {else}
                            {$currentContext->getLocalizedName()|substr:0:2|upper}
                        {/if}
                    {else}
                        OJ
                    {/if}
                </div>

                <p class="footer-desc">
                    {if $currentContext}
                        {$currentContext->getLocalizedDescription()|strip_tags|truncate:150:"..."}
                    {else}
                        Open Access Journal System managed by Universitas Teknologi Indonesia.
                    {/if}
                </p>
            </div>

            {* KOLOM 2: Informasi *}
            <div class="footer-col">
                <h3 class="footer-heading">{translate key="plugins.block.information.link"}</h3>
                <ul class="footer-links">
                    <li><a href="{url page="information" op="readers"}">{translate key="navigation.infoForReaders"}</a></li>
                    <li><a href="{url page="information" op="authors"}">{translate key="navigation.infoForAuthors"}</a></li>
                    <li><a href="{url page="information" op="librarians"}">{translate key="navigation.infoForLibrarians"}</a></li>
                </ul>
            </div>

            {* KOLOM 3: Quick Links *}
            <div class="footer-col">
                <h3 class="footer-heading">Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="{url page="about" op="editorialTeam"}">{translate key="about.editorialTeam"}</a></li>
                    <li><a href="{url page="about" op="contact"}">{translate key="about.contact"}</a></li>
                    <li><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
                    <li><a href="{url page="about" op="submissions"}">{translate key="about.submissions"}</a></li>
                </ul>
            </div>

            {* KOLOM 4: Kontak *}
            <div class="footer-col contact-col">
                <h3 class="footer-heading">{translate key="about.contact"}</h3>
                <div class="contact-info">
                    
                    {if $currentContext && $currentContext->getData('mailingAddress')}
                    <p>
                        <strong>Address:</strong><br>
                        {$currentContext->getData('mailingAddress')|nl2br|strip_tags}
                    </p>
                    {/if}

                    {if $currentContext && $currentContext->getData('contactEmail')}
                    <p>
                        <strong>Email:</strong><br>
                        <a href="mailto:{$currentContext->getData('contactEmail')|escape}">
                            {$currentContext->getData('contactEmail')|escape}
                        </a>
                    </p>
                    {/if}

                    {if $currentContext && $currentContext->getData('publisherInstitution')}
                    <p>
                        <strong>Publisher:</strong><br>
                        {$currentContext->getData('publisherInstitution')|escape}
                    </p>
                    {/if}

                </div>
            </div>

        </div>

        {* Copyright *}
        <div class="footer-bottom-row">
            <p>
                &copy; {$smarty.now|date_format:"Y"} 
                {if $currentContext}
                    <strong>{$currentContext->getLocalizedName()|escape}</strong>
                {/if}
                . All Rights Reserved.
            </p>
        </div>

    </div>
</div>

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>