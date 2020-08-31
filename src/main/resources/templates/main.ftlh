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

    <a class="btn btn-warning mb-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>

    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group">
            <form method="post" action="/main" enctype="multipart/form-data" >
                <div class="form-group mb-2">
                    <input type="text" name="text" placeholder="Message"
                           value="<#if message??>${message.text}</#if>"
                           class="form-control ${(textError??)?string('is-invalid', '')}"/>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group mb-2">
                    <input type="text" name="tag" placeholder="Tag"
                           value="<#if message??>${message.tag}</#if>"
                           class="form-control  ${(tagError??)?string('is-invalid', '')}"/>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="custom-file">
                    <input type="file" name="file" id="customFile"/>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group mt-2">
                    <button type="submit" class="btn btn-danger">Send</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}">
                    </#if>
                </div>
                <div class="card-header">
                    ${message.tag}
                </div>
                <p class="card-text m-2">${message.text}</p>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>