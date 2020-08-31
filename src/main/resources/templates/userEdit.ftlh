<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-group">
        <form method="post" action="/user">
            <input type="text" name="username" value="${user.username}" class="form-control mb-2"/>
            <#list roles as role>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" id="inlineCheckbox" type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>
                    <label class="form-check-label" for="inlineCheckbox">${role}</label>
                </div>
            </#list>
            <input type="hidden" value="${user.id}" name="userID"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-danger mt-2">Save</button>
        </form>
    </div>
</@c.page>