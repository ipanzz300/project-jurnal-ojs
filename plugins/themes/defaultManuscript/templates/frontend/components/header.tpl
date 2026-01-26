{**
 * plugins/themes/defaultManuscript/templates/frontend/components/header.tpl
 *}

<header class="site-header">

  {* ================= TOP BAR ================= *}
  <div class="top-bar">
    <div class="top-bar-inner">
      <div class="top-right">
        <a href="{url page="index"}">🌐 Bahasa Indonesia</a>
        {if !$loggedIn}
          <a href="{url page="user" op="register"}">Daftar</a>
          <a href="{url page="login"}">Login</a>
        {else}
          <a href="{url page="user"}">Dashboard</a>
        {/if}
      </div>
    </div>
  </div>

  {* ================= MAIN HEADER ================= *}
  <div class="main-header">
    <div class="main-header-inner">

      {* BRAND *}
      <div class="brand">
        <div class="logo-box">
          JI
        </div>
        <div class="brand-text">
          <h1>{$displayPageHeaderTitle|default:$siteTitle|escape}</h1>
          {if $currentContext}
            <p>
              {if $currentContext->getData('onlineIssn')}
                E-ISSN: {$currentContext->getData('onlineIssn')}
              {/if}
              {if $currentContext->getData('printIssn')}
                | P-ISSN: {$currentContext->getData('printIssn')}
              {/if}
            </p>
          {/if}
        </div>
      </div>

      {* SEARCH *}
      <div class="header-search">
        <form action="{url page="search"}" method="get">
          <input type="text" name="query" placeholder="Cari artikel...">
          <button type="submit">🔍</button>
        </form>
      </div>

    </div>
  </div>

  {* ================= NAVIGATION ================= *}
  <nav class="main-nav">
    {load_menu name="primary" ulClass="nav-menu"}
  </nav>

</header>
