
<%@ page import="menu.manager.MainMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'MainMenu')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'mainMenu.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'mainMenu.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'mainMenu.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'mainMenu.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="backGroundPicture" title="${message(code: 'mainMenu.backGroundPicture.label', default: 'Back Ground Picture')}" />
                        
                            <g:sortableColumn property="backGroundPictureType" title="${message(code: 'mainMenu.backGroundPictureType.label', default: 'Back Ground Picture Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mainMenuInstanceList}" status="i" var="mainMenuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${mainMenuInstance.id}">${fieldValue(bean: mainMenuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "backGroundPicture")}</td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "backGroundPictureType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${mainMenuInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
