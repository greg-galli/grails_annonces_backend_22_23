<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <!-- Custom styles for this page -->
    <link href="/assets/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body>

<div id="list-user" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"><g:message code="default.list.label" args="[entityName]"/></h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Username</th>
                        <th>Enabled</th>
                        <th>Annonces</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Username</th>
                        <th>Enabled</th>
                        <th>Annonces</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <g:each in="${userList}" var="user">
                        <tr>
                            <td><g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></td>
                            <td>${user.enabled ? "Yes" : "No"}</td>
                            <td><g:link controller="annonce" action="index" params="[author: user.id]">Author of ${user.annonces.size() != 0 ? user.annonces.size() : "no"} annonce(s)</g:link></td>
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

<!-- Page level plugins -->
<script src="/assets/datatables/jquery.dataTables.min.js"></script>
<script src="/assets/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/assets/demo/datatables-demo.js"></script>
</body>
</html>