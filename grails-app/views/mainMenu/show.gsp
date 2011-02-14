
<%@ page import="menu.manager.MainMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'MainMenu')}" />
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
                            <td valign="top" class="name"><g:message code="mainMenu.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.backGroundColor.label" default="Back Ground Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "backGroundColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.backGroundPic.label" default="Back Ground Pic" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "backGroundPic")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.font.label" default="Font" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "font")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.fontColor.label" default="Font Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mainMenuInstance, field: "fontColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.layouts.label" default="Layouts" /></td>
                            
                            <td valign="top" class="value"><g:link controller="layouts" action="show" id="${mainMenuInstance?.layouts?.id}">${mainMenuInstance?.layouts?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="mainMenu.menu.label" default="Menu" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${mainMenuInstance.menu}" var="m">
                                    <li><g:link controller="menu" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${mainMenuInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
