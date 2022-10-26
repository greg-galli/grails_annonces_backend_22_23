<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><g:message code="default.edit.label" args="[entityName]" /></h1>
</div>
<div id="edit-annonce" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="update" id="${annonce.id}" enctype="multipart/form-data" method="POST">
        <fieldset class="form">
            <div class="form-group">
                <input type="text" class="form-control form-control-user" value="${annonce.title}"
                       id="title" name="title" placeholder="Title">
            </div>
            <div class="form-group">
                <input type="text" class="form-control form-control-user" value="${annonce.description}"
                       id="description" name="description" placeholder="Description">
            </div>
            <div class="form-group">
                <input type="text" class="form-control form-control-user" value="${annonce.price}"
                       id="price" name="price" placeholder="Price">
            </div>
            <div class="form-group">
                <g:select name="author.id" from="${userList}" value="${annonce.author.id}" optionKey="id" optionValue="username" class="form-control form-control-user"/>
            </div>

            <div class="form-group">
                <input type="file" multiple class="form-control form-control-user"
                       id="illustration" name="files" placeholder="Annonce title ...">
            </div>
            <div class="form-group">
                <label>Illustrations</label>

                <div>
                    <g:each in="${annonce.illustrations}" var="illu">
                        <g:link controller="annonce" action="deleteIllu" id="${illu.id}">
                            <img width="150" src="${grailsApplication.config.illustrations.baseUrl + illu.filename}"/>
                        </g:link>
                    </g:each>
                </div>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save  btn-primary btn-user btn-block" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
    <g:link controller="annonce" action="delete" id="${annonce.id}"><button class="mt-2 btn-danger btn-user btn-block">Delete</button></g:link>
</div>
</body>
</html>
