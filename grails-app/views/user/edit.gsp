<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><g:message code="default.edit.label" args="[entityName]" /></h1>
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
    <g:form controller="user" action="update" id="${user.id}">
        <fieldset class="form">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control form-control-user"
                       id="username" name="username" placeholder="Username" value="${user.username}">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control form-control-user"
                       id="password" name="password" placeholder="Password" value="${user.password}">
            </div>
            <div class="form-group">
                <label>Role</label>
                <g:select name="role" from="${roleList}" value="${user.getAuthorities()[0]?.id}" optionKey="id" optionValue="authority" class="form-control form-control-user"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save btn-primary btn-user btn-block" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
    <g:link controller="user" action="delete" id="${user.id}"><button class="mt-2 btn-danger btn-user btn-block">Delete</button></g:link>
</div>
</body>
</html>
