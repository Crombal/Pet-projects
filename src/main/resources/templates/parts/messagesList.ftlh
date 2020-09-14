<#include "security.ftlh">

<div class="card-columns" id="message-list">

    <#list messages as message>
        <div class="card my-3" data-id="${message.id}">

            <div>
                <#if message.filename??>
                    <img class="card-img-top" src="/img/${message.filename}"/>
                </#if>
            </div>

            <div class="card-header" data-id="${message.id}">
                #${message.tag}
            </div>

            <p class="card-text m-2">${message.text}</p>

            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                </#if>
            </div>

        </div>

    <#else>
        No messages
    </#list>

</div>