

<%@ page import="menu.manager.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${menuInstance}">
            <div class="errors">
                <g:renderErrors bean="${menuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${menuInstance?.id}" />
                <g:hiddenField name="version" value="${menuInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="menu.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${menuInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="backGroundPicture"><g:message code="menu.backGroundPicture.label" default="Back Ground Picture" /></label>
                                </td>
                                <td><img class="Photo" src="${createLink(action:'getImage')}?backGroundPicture=${menuInstance?.backGroundPicture}" />
							<span class="button"><g:actionSubmit class="save" action="uploadPicture"
							value="${message(code: 'default.button.change.picture', default: 'change picture')}" /></span></td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mainMenu"><g:message code="menu.mainMenu.label" default="Main Menu" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'mainMenu', 'errors')}">
                                    <g:select name="mainMenu.id" from="${menu.manager.MainMenu.list()}" optionKey="id" value="${menuInstance?.mainMenu?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="panel"><g:message code="menu.panel.label" default="Panel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'panel', 'errors')}">
                                    <g:select name="panel.id" from="${menu.manager.Panel.list()}" optionKey="id" value="${menuInstance?.panel?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="backGroundColor"><g:message code="menu.backGroundColor.label" default="Back Ground Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'backGroundColor', 'errors')}">
                                    <g:textField name="backGroundColor" value="${menuInstance?.backGroundColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="menu.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${menuInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="font"><g:message code="menu.font.label" default="Font" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'font', 'errors')}">
                                    <g:textField name="font" value="${menuInstance?.font}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fontColor"><g:message code="menu.fontColor.label" default="Font Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'fontColor', 'errors')}">
                                    <g:textField name="fontColor" value="${menuInstance?.fontColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subMenu"><g:message code="menu.subMenu.label" default="Sub Menu" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'subMenu', 'errors')}">
                                    
<ul>
<g:each in="${menuInstance?.subMenu?}" var="s">
    <li><g:link controller="subMenu" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="subMenu" action="create" params="['menu.id': menuInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subMenu.label', default: 'SubMenu')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="menu.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${menuInstance?.title}" />
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
