<#import "parts/common.ftlh" as c>

<@c.page>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Role</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td scope="row">
                    ${user.username}
                </td>
                <td>
                    <#list user.roles as role>${role}<#sep>, </#list>
                </td>
                <td>
                    <a href="/user/${user.id}">Edit</a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>