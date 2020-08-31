<#import "parts/common.ftlh" as c>

<@c.page>
    <h5 class="text-muted">${username}</h5>
    <p class="h6 my-3">${message!}</p>
    <form method="post">
        <div class="form-group row">
            <div class="col-sm-3">
                <input type="email" name="email" placeholder="New email" class="form-control"/>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-3">
                <input type="password" name="password" placeholder="New password" class="form-control"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Update profile</button>
    </form>
</@c.page>