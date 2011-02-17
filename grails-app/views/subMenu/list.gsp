
<%@ page import="menu.manager.SubMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subMenu.label', default: 'SubMenu')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'subMenu.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'subMenu.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="backGroundPicture" title="${message(code: 'subMenu.backGroundPicture.label', default: 'Back Ground Picture')}" />
                        
                            <g:sortableColumn property="backGroundPictureType" title="${message(code: 'subMenu.backGroundPictureType.label', default: 'Back Ground Picture Type')}" />
                        
                            <th><g:message code="subMenu.menu.label" default="Menu" /></th>
                        
                            <g:sortableColumn property="backGroundColor" title="${message(code: 'subMenu.backGroundColor.label', default: 'Back Ground Color')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${subMenuInstanceList}" status="i" var="subMenuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${subMenuInstance.id}">${fieldValue(bean: subMenuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: subMenuInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: subMenuInstance, field: "backGroundPicture")}</td>
                        
                            <td>${fieldValue(bean: subMenuInstance, field: "backGroundPictureType")}</td>
                        
                            <td>${fieldValue(bean: subMenuInstance, field: "menu")}</td>
                        
                            <td>${fieldValue(bean: subMenuInstance, field: "backGroundColor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${subMenuInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
