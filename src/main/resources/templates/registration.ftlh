<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <p class="h6 my-3">${message!}</p>
    <@l.login "/registration" true/>
</@c.page>