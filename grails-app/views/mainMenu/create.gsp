

<%@ page import="menu.manager.MainMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'MainMenu')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${mainMenuInstance}">
            <div class="errors">
                <g:renderErrors bean="${mainMenuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
 <!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="backGroundPicture"><g:message code="mainMenu.backGroundPicture.label" default="Back Ground Picture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'backGroundPicture', 'errors')}">
                                    <g:textField name="backGroundPicture" value="${mainMenuInstance?.backGroundPicture}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="backGroundPictureType"><g:message code="mainMenu.backGroundPictureType.label" default="Back Ground Picture Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'backGroundPictureType', 'errors')}">
                                    <g:select name="backGroundPictureType" from="${mainMenuInstance.constraints.backGroundPictureType.inList}" value="${mainMenuInstance?.backGroundPictureType}" valueMessagePrefix="mainMenu.backGroundPictureType" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            -->
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
                                    <label for="backGroundColor"><g:message code="mainMenu.backGroundColor.label" default="Back Ground Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'backGroundColor', 'errors')}">
                                    <g:textField name="backGroundColor" value="${mainMenuInstance?.backGroundColor}" />
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
