<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />

<div class="card-columns" id="message-list">
    <#list page.content as message>
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

            <div class="card-footer text-muted container">
                <div class="raw">
                    <a class="col align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <a class="col align-self-center" href="/messages/${message.id}/like">
                        <#if message.meLiked>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                        ${message.likes}
                    </a>
                    <#if message.author.id == currentUserId>
                        <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                    </#if>
                </div>
            </div>

        </div>

    <#else>
        No messages
    </#list>

</div>

<@p.pager url page />