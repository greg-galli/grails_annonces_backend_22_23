<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

</head>

<body>

<div id="list-user" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"><g:message code="default.list.label"
                                                                     args="[entityName]"/></h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Illustrations</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Illustrations</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <g:each in="${annonceList}" var="annonce">
                        <tr>
                            <td><g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link></td>
                            <td>${annonce.description}</td>
                            <td>${annonce.price}</td>
                            <td>
                                <g:each in="${annonce.illustrations}">
                                <img src="${grailsApplication.config.illustrations.baseUrl+it.filename}"/>
                                </g:each>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${userCount ?: 0}"/>
    </div>
</div>

</body>
</html>