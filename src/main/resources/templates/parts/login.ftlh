<#include "security.ftlh">
<#macro login path isRegisterForm>

    <form action="${path}" method="post">
        <input type="hidden" id="myurl" name="myurl"/>

        <script type="text/javascript">
            document.getElementById('myurl').value = window.location.href
        </script>

        <div class="form-group row">
            <div class="col-sm-3">
                <input type="text" name="username" placeholder="Username"
                       value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-3">
                <input type="password" name="password" placeholder="Password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>

        <#if isRegisterForm>

            <div class="form-group row">
                <div class="col-sm-3">
                    <input type="password" name="password2" placeholder="Retype password"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-3">
                    <input type="email" name="email" placeholder="Email@email.com"
                           value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-group row col-sm-3">
                <div class="g-recaptcha" data-sitekey="6Le85cUZAAAAAAJXkhK9T06IlXMzqqb9P6mFpDZn"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>

        </#if>

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
        <button type="submit" class="btn btn-dark"><#if user??>Log Out<#else>Log in</#if></button>
    </form>

</#macro>