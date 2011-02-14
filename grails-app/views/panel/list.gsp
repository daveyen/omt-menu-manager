
<%@ page import="menu.manager.Panel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'panel.label', default: 'Panel')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'panel.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'panel.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="position" title="${message(code: 'panel.position.label', default: 'Position')}" />
                        
                            <th><g:message code="panel.layouts.label" default="Layouts" /></th>
                        
                            <g:sortableColumn property="backGroundPic" title="${message(code: 'panel.backGroundPic.label', default: 'Back Ground Pic')}" />
                        
                            <g:sortableColumn property="backgroundColor" title="${message(code: 'panel.backgroundColor.label', default: 'Background Color')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${panelInstanceList}" status="i" var="panelInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${panelInstance.id}">${fieldValue(bean: panelInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: panelInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: panelInstance, field: "position")}</td>
                        
                            <td>${fieldValue(bean: panelInstance, field: "layouts")}</td>
                        
                            <td>${fieldValue(bean: panelInstance, field: "backGroundPic")}</td>
                        
                            <td>${fieldValue(bean: panelInstance, field: "backgroundColor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${panelInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
