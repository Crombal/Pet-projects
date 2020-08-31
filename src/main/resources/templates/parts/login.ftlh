<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <div class="col-sm-3">
                <input type="text" name="username" placeholder="Username" class="form-control"/>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-3">
                <input type="password" name="password" placeholder="Password" class="form-control"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm>
            <a class="btn btn-success" href="/registration">Registration</a>
        </#if>
        <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-dark">Sign Out</button>
    </form>
</#macro>