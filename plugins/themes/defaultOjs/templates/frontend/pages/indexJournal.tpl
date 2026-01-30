{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">
    {call_hook name="Templates::Index::journal"}

    {* === HERO BANNER === *}
    <section class="custom-hero-banner ojs-hero-wrapper">
        <div class="container">
            <div class="hero-inner">

                <span class="hero-subtitle ojs-hero-subtitle">
                    Open Access Journal
                </span>

                <h1 class="hero-title ojs-hero-title">
                    {$currentJournal->getLocalizedName()|escape}
                </h1>

                {* strip_tags = Menghapus format bold/enter dari editor admin biar teksnya rapi *}
                <div class="hero-tagline ojs-hero-tagline">
                    {$currentJournal->getLocalizedDescription()|strip_tags}
                </div>

                <div class="hero-btns ojs-hero-buttons">
                    <a href="{url page="about" op="submissions"}" class="btn-main ojs-btn-submission">
                        Make a Submission
                    </a>
                    <a href="#homepageIssue" class="btn-outline-hero ojs-btn-issue">
                        View Current Issue
                    </a>
                </div>

            </div>
        </div>
    </section>

    {* === MAIN CONTENT === *}
    <div class="container content-wrapper ojs-content-wrapper">
        <div class="row">
            
            {* Bagian Kiri: HANYA CURRENT ISSUE *}
            <main class="col-lg-8 col-md-12 ojs-main-content">

                {if $issue}
                <section class="current_issue content-card ojs-issue-card" id="homepageIssue">
                    <div class="card-header-custom">
                        <h2 class="section-title">
                            <svg class="icon-title" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                <polyline points="14 2 14 8 20 8"></polyline>
                                <line x1="16" y1="13" x2="8" y2="13"></line>
                                <line x1="16" y1="17" x2="8" y2="17"></line>
                                <polyline points="10 9 9 9 8 9"></polyline>
                            </svg>
                            {translate key="journal.currentIssue"}
                        </h2>
                        <span class="badge-new">Latest</span>
                    </div>

                    <div class="toc-wrapper">
                        {include file="frontend/objects/issue_toc.tpl" heading="h3"}
                    </div>

                    {* === TOMBOL READ MORE (MASKING VERSION) === *}
<div class="card-footer-custom">
    <a href="{url page="issue" op="view" path=$issue->getBestIssueId()}" class="learn-more">
        
        {* LAYER 1: Lingkaran Biru + Panah + Teks Putih (Masking) *}
        <span class="circle" aria-hidden="true">
            <span class="icon arrow"></span>
            <span class="button-text white">Read Full Issue</span>
        </span>
        
        
        <span class="button-text blue">Read Full Issue</span>
        
    </a>
</div>

                </section>
                {/if}

            </main>

            
            <aside class="col-lg-4 col-md-12 ojs-sidebar">
                <div class="custom-sidebar">
                    {call_hook name="Templates::Common::Sidebar"}
                </div>
            </aside>
        </div>
    </div>
</div>

{include file="frontend/components/footer.tpl"}