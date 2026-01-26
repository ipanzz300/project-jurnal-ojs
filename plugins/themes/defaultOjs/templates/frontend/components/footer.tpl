{**
 * templates/frontend/components/footer.tpl
 *
 * Custom Footer Layout - 4 Columns + Auto Initials + Dark Mode Support
 *}

	</div>{* Akhir dari main content div (JANGAN DIHAPUS) *}

	{* --- SIDEBAR LOGIC OJS (JANGAN DIHAPUS) --- *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary">
				{$sidebarCode}
			</div>
		{/if}
	{/if}

</div>{* Akhir dari pkp_structure_body *}

{* =======================================================
   [CUSTOM FOOTER START]
   ======================================================= *}
<div class="custom-footer-wrapper" role="contentinfo">
    <div class="custom-footer-container">
        
        <div class="footer-top-row">
            
            <div class="footer-col branding-col">
                {* === [UPDATE] LOGIKA OTOMATIS INISIAL JURNAL === *}
                <div class="journal-icon-box" style="margin-bottom: 20px;">
                    {if $currentContext}
                        {* Coba ambil Akronim dulu (misal: JIT) *}
                        {assign var="acronym" value=$currentContext->getLocalizedAcronym()}
                        {if $acronym}
                            {$acronym|escape}
                        {else}
                            {* Jika tidak ada, ambil 2 huruf pertama nama jurnal (misal: JT) *}
                            {$currentContext->getLocalizedName()|substr:0:2|upper}
                        {/if}
                    {else}
                        JT
                    {/if}
                </div>
                {* === END UPDATE === *}

                <p class="footer-desc">
                    Jurnal Teknologi ini berkomitmen untuk menerbitkan 
                    penelitian berkualitas tinggi yang dapat diakses secara terbuka oleh publik.
                </p>
            </div>

            <div class="footer-col">
                <h3 class="footer-heading">Informasi</h3>
                <ul class="footer-links">
                    <li><a href="{url page="information" op="readers"}">Untuk Pembaca</a></li>
                    <li><a href="{url page="information" op="authors"}">Untuk Penulis</a></li>
                    <li><a href="{url page="information" op="librarians"}">Untuk Pustakawan</a></li>
                </ul>
            </div>

            <div class="footer-col">
                <h3 class="footer-heading">Tautan Cepat</h3>
                <ul class="footer-links">
                    <li><a href="{url page="about" op="editorialTeam"}">Tim Editorial</a></li>
                    <li><a href="{url page="about" op="contact"}">Reviewer</a></li>
                    <li><a href="{url page="issue" op="archive"}">Arsip Jurnal</a></li>
                    <li><a href="{url page="about" op="submissions"}">Submit Artikel</a></li>
                </ul>
            </div>

            <div class="footer-col contact-col">
                <h3 class="footer-heading">Kontak</h3>
                <div class="contact-info">
                    <p>
                        <strong>Alamat:</strong><br>
                        Gedung Rektorat Lt. 2, Universitas Teknologi Indonesia
                    </p>
                    <p>
                        <strong>Email:</strong><br>
                        <a href="mailto:editor@jurnal-jit.ac.id">editor@jurnal-jit.ac.id</a>
                    </p>
                </div>
            </div>

        </div>

        <div class="footer-bottom-row">
            <p>&copy; {$smarty.now|date_format:"Y"} Jurnal Teknologi. Powered by Open Journal Systems.</p>
        </div>

    </div>
</div>

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>