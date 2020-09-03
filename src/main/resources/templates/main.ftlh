<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-3">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" placeholder="Search by tag" value="${filter!}" class="form-control"/>
                <button type="submit" class="btn btn-danger ml-2">Find</button>
            </form>
        </div>
    </div>

    <#include "parts/messagesEdit.ftlh"/>

    <#include "parts/messagesList.ftlh"/>

</@c.page>