
<%@ page import="menu.manager.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'admin.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="login" title="${message(code: 'admin.login.label', default: 'Login')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'admin.password.label', default: 'Password')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${adminInstanceList}" status="i" var="adminInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${adminInstance.id}">${fieldValue(bean: adminInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "login")}</td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "password")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${adminInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
