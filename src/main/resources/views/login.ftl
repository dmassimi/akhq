<#ftl output_format="HTML" encoding="UTF-8">

<#-- @ftlvariable name="basePath" type="java.lang.String" -->
<#-- @ftlvariable name="oidcEnabled" type="java.lang.Boolean" -->
<#-- @ftlvariable name="oidcProviders" type="java.util.Map<java.lang.String, org.akhq.configs.Oidc.Provider>" -->

<#import "includes/template.ftl" as template>

<@template.header "Login" />

<form class="khq-login" method="POST" action="${basePath}/login">
    <div>
        <h3 class="logo"><img src="${basePath}/static/img/logo.svg" alt=""/></h3>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fa fa-user"></i></span>
        </div>
        <input type="text" name="username" class="form-control" placeholder="Username" aria-label="Username" required autofocus>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fa fa-lock"></i></span>
        </div>
        <input type="password" name="password" class="form-control" placeholder="Password" aria-label="Password" required>
    </div>

    <div class="form-group text-right">
        <input type="submit" value="Login" class="btn btn-primary btn-lg">
    </div>
    <#if oidcEnabled>
        <div class="form-separator">
            <span>or</span>
        </div>
        <#list oidcProviders?keys as providerKey>
            <#assign provider = oidcProviders[providerKey]>
            <a href="${basePath}/oauth/login/${providerKey}" class="btn btn-primary btn-lg btn-block">${provider.label}</a>
        </#list>
    </#if>
</form>

<@template.footer/>
