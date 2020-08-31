<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        isPresent = true
    >
<#else>
    <#assign
        name = "Quest"
        isAdmin = false
        isPresent = false
    >
</#if>