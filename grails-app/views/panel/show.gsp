
<%@ page import="menu.manager.Panel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'panel.label', default: 'Panel')}" />
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
                            <td valign="top" class="name"><g:message code="panel.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.position.label" default="Position" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "position")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.layouts.label" default="Layouts" /></td>
                            
                            <td valign="top" class="value"><g:link controller="layouts" action="show" id="${panelInstance?.layouts?.id}">${panelInstance?.layouts?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.backGroundPic.label" default="Back Ground Pic" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "backGroundPic")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.backgroundColor.label" default="Background Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "backgroundColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.font.label" default="Font" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "font")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.panelSize.label" default="Panel Size" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "panelSize")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${panelInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
