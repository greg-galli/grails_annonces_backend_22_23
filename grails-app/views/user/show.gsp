<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><g:message code="default.show.label" args="[entityName]" /></h1>
</div>
<div id="create-annonce" class="content scaffold-create" role="main">
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
    <g:form controller="user" action="edit" id="${user.id}">
        <fieldset class="form">
            <div class="form-group">
                <input type="text" class="form-control form-control-user"
                       id="username" name="username" placeholder="Username" disabled value="${user.username}">
            </div>
            <div class="form-group">
                <input type="password" class="form-control form-control-user"
                       id="password" name="password" placeholder="Password" disabled value="${user.password}">
            </div>
            <div class="form-group">
                <input type="text" class="form-control form-control-user"
                       id="role" name="role" placeholder="Role" disabled value="${user.getAuthorities().authority.join(',')}">
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save  btn-primary btn-user btn-block" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
