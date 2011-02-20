
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
                        
                            <g:sortableColumn property="backGroundPicture" title="${message(code: 'item.backGroundPicture.label', default: 'Back Ground Picture')}" />
                        
                            <g:sortableColumn property="backGroundPictureType" title="${message(code: 'item.backGroundPictureType.label', default: 'Back Ground Picture Type')}" />
                        
                            <th><g:message code="item.subMenu.label" default="Sub Menu" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "type")}</td>
                        
							<td>
							<g:link action="show" id="${itemInstance.id}">
							<img class="Photo"	src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=item-${itemInstance?.id}.${itemInstance?.backGroundPictureType}" />
							</g:link></td>                        
                            <td>${fieldValue(bean: itemInstance, field: "backGroundPictureType")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "subMenu")}</td>
                        
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
