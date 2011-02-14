
<%@ page import="menu.manager.Layouts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'layouts.label', default: 'Layouts')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'layouts.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'layouts.name.label', default: 'Name')}" />
                        
                            <th><g:message code="layouts.admin.label" default="Admin" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${layoutsInstanceList}" status="i" var="layoutsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="showLayouts" id="${layoutsInstance.id}">${fieldValue(bean: layoutsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: layoutsInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: layoutsInstance, field: "admin")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${layoutsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
