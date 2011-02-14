
<%@ page import="menu.manager.Item" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'item.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'item.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'item.type.label', default: 'Type')}" />
                        
                            <th><g:message code="item.subMenu.label" default="Sub Menu" /></th>
                        
                            <g:sortableColumn property="backGroundColor" title="${message(code: 'item.backGroundColor.label', default: 'Back Ground Color')}" />
                        
                            <g:sortableColumn property="backGroundPicture" title="${message(code: 'item.backGroundPicture.label', default: 'Back Ground Picture')}" />
                            <g:sortableColumn property="title" title="${message(code: 'item.title.label', default: 'Title')}" />
                            <g:sortableColumn property="price" title="${message(code: 'item.price.label', default: 'Price')}" />
                    
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "subMenu")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "backGroundColor")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "backGroundPicture")}</td>
                            
                            <td>${fieldValue(bean: itemInstance, field: "title")}</td>
                            
                            <td>${fieldValue(bean: itemInstance, field: "price")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${itemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
