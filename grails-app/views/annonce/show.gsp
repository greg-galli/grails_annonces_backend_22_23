<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><g:message code="default.show.label" args="[entityName]"/></h1>
</div>

<div id="create-annonce" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="edit" id="${annonce.id}">
        <fieldset class="form">
            <div class="form-group">
                <label>Title</label>
                <input type="text" class="form-control form-control-user" value="${annonce.title}" disabled
                       id="title" name="title" placeholder="Title">
            </div>

            <div class="form-group">
                <label>Description</label>
                <input type="text" class="form-control form-control-user" value="${annonce.description}" disabled
                       id="description" name="description" placeholder="Description">
            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="text" class="form-control form-control-user" value="${annonce.price}" disabled
                       id="price" name="price" placeholder="Price">
            </div>

            <div class="form-group">
                <label>Author</label>
                <input type="text" class="form-control form-control-user" value="${annonce.author.username}" disabled
                       id="author.id" name="author.id" placeholder="Price">
            </div>

            <div class="form-group">
                <label>Illustrations</label>

                <div>
                    <g:each in="${annonce.illustrations}" var="illu">
                        <img width="150" src="${grailsApplication.config.illustrations.baseUrl + illu.filename}"/>
                    </g:each>
                </div>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save  btn-primary btn-user btn-block"
                            value="${message(code: 'default.button.edit.label', default: 'Edit')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
