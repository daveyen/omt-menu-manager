

<%@ page import="menu.manager.SubMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subMenu.label', default: 'SubMenu')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${subMenuInstance}">
            <div class="errors">
                <g:renderErrors bean="${subMenuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="subMenu.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${subMenuInstance?.name}" />
                                </td>
                            </tr>
                        
                            <!--<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="backGroundPicture"><g:message code="subMenu.backGroundPicture.label" default="Back Ground Picture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'backGroundPicture', 'errors')}">
                                    <g:textArea name="backGroundPicture" cols="40" rows="5" value="${subMenuInstance?.backGroundPicture}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="backGroundPictureType"><g:message code="subMenu.backGroundPictureType.label" default="Back Ground Picture Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'backGroundPictureType', 'errors')}">
                                    <g:textField name="backGroundPictureType" value="${subMenuInstance?.backGroundPictureType}" />
                                </td>
                            </tr>
                        
                            --><tr class="prop">
                                <td valign="top" class="name">
                                    <label for="menu"><g:message code="subMenu.menu.label" default="Menu" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'menu', 'errors')}">
                                    <g:select name="menu.id" from="${menu.manager.Menu.list()}" optionKey="id" value="${subMenuInstance?.menu?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="backGroundColor"><g:message code="subMenu.backGroundColor.label" default="Back Ground Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'backGroundColor', 'errors')}">
                                    <g:textField name="backGroundColor" value="${subMenuInstance?.backGroundColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="subMenu.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${subMenuInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="font"><g:message code="subMenu.font.label" default="Font" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'font', 'errors')}">
                                    <g:textField name="font" value="${subMenuInstance?.font}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fontColor"><g:message code="subMenu.fontColor.label" default="Font Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'fontColor', 'errors')}">
                                    <g:textField name="fontColor" value="${subMenuInstance?.fontColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="subMenu.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subMenuInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${subMenuInstance?.title}" />
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
