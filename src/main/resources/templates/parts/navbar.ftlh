<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <a class="navbar-brand" href="">Switter</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/main"><#if user?? && name!="Guest">Message<#else>Log in</#if></a>
            </li>

            <#if user?? && name!="Guest">
            <li class="nav-item">
                <a class="nav-link" href="/user-messages/${currentUserId}"><#if user?? && name!="Guest">My message<#else>My messages</#if></a>
            </li>
            </#if>

            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
            </#if>

            <#if user?? && name!="Guest">
            <li class="nav-item">
                <a class="nav-link" href="/user/profile">My profile</a>
            </li>
            </#if>

        </ul>

        <div class="navbar-text mr-3">${name}</div>

        <#if isPresent><@l.logout/></#if>

    </div>

</nav>