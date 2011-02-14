
<%@ page import="menu.manager.SubMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subMenu.label', default: 'SubMenu')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.menu.label" default="Menu" /></td>
                            
                            <td valign="top" class="value"><g:link controller="menu" action="show" id="${subMenuInstance?.menu?.id}">${subMenuInstance?.menu?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.backGroundColor.label" default="Back Ground Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "backGroundColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.backGroundPicture.label" default="Back Ground Picture" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "backGroundPicture")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.font.label" default="Font" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "font")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.fontColor.label" default="Font Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "fontColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.item.label" default="Item" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${subMenuInstance.item}" var="i">
                                    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="subMenu.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subMenuInstance, field: "title")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${subMenuInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
