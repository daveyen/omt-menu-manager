
<%@ page import="menu.manager.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'menu.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'menu.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="backGroundPicture" title="${message(code: 'menu.backGroundPicture.label', default: 'Back Ground Picture')}" />
                        
                            <g:sortableColumn property="backGroundPictureType" title="${message(code: 'menu.backGroundPictureType.label', default: 'Back Ground Picture Type')}" />
                        
                            <th><g:message code="menu.mainMenu.label" default="Main Menu" /></th>
                        
                            <th><g:message code="menu.panel.label" default="Panel" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${menuInstanceList}" status="i" var="menuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "name")}</td>
                        
                            <td>
                            <g:link action="show" id="${menuInstance.id}">
                            <img class="Photo"	src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=menu-${menuInstance?.id}.${menuInstance?.backGroundPictureType}" />
                        	</g:link></td>
                            <td>${fieldValue(bean: menuInstance, field: "backGroundPictureType")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "mainMenu")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "panel")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${menuInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
