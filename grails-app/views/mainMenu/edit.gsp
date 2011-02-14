

<%@ page import="menu.manager.MainMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'MainMenu')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${mainMenuInstance}">
            <div class="errors">
                <g:renderErrors bean="${mainMenuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${mainMenuInstance?.id}" />
                <g:hiddenField name="version" value="${mainMenuInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="mainMenu.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${mainMenuInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="mainMenu.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${mainMenuInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="mainMenu.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${mainMenuInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="backGroundColor"><g:message code="mainMenu.backGroundColor.label" default="Back Ground Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'backGroundColor', 'errors')}">
                                    <g:textField name="backGroundColor" value="${mainMenuInstance?.backGroundColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="backGroundPic"><g:message code="mainMenu.backGroundPic.label" default="Back Ground Pic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'backGroundPic', 'errors')}">
                                    <g:textField name="backGroundPic" value="${mainMenuInstance?.backGroundPic}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="font"><g:message code="mainMenu.font.label" default="Font" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'font', 'errors')}">
                                    <g:textField name="font" value="${mainMenuInstance?.font}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fontColor"><g:message code="mainMenu.fontColor.label" default="Font Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'fontColor', 'errors')}">
                                    <g:textField name="fontColor" value="${mainMenuInstance?.fontColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="layouts"><g:message code="mainMenu.layouts.label" default="Layouts" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'layouts', 'errors')}">
                                    <g:select name="layouts.id" from="${menu.manager.Layouts.list()}" optionKey="id" value="${mainMenuInstance?.layouts?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="menu"><g:message code="mainMenu.menu.label" default="Menu" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'menu', 'errors')}">
                                    
<ul>
<g:each in="${mainMenuInstance?.menu?}" var="m">
    <li><g:link controller="menu" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="menu" action="create" params="['mainMenu.id': mainMenuInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'menu.label', default: 'Menu')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
