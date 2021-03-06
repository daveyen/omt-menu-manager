

<%@ page import="menu.manager.Panel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'panel.label', default: 'Panel')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${panelInstance}">
            <div class="errors">
                <g:renderErrors bean="${panelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${panelInstance?.id}" />
                <g:hiddenField name="version" value="${panelInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="panel.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${panelInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="position"><g:message code="panel.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'position', 'errors')}">
                                    <g:select name="position" from="${panelInstance.constraints.position.inList}" value="${panelInstance?.position}" valueMessagePrefix="panel.position"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="backGroundPicture"><g:message code="panel.backGroundPicture.label" default="Back Ground Picture" /></label>
                                </td>
                                <td><img class="Photo" src="${createLink(action:'getImage')}?backGroundPicture=${panelInstance?.backGroundPicture}" />
							<span class="button"><g:actionSubmit class="save" action="uploadPicture"
							value="${message(code: 'default.button.change.picture', default: 'change picture')}" /></span></td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="layouts"><g:message code="panel.layouts.label" default="Layouts" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'layouts', 'errors')}">
                                    <g:select name="layouts.id" from="${menu.manager.Layouts.list()}" optionKey="id" value="${panelInstance?.layouts?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="backgroundColor"><g:message code="panel.backgroundColor.label" default="Background Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'backgroundColor', 'errors')}">
                                    <g:textField name="backgroundColor" value="${panelInstance?.backgroundColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="font"><g:message code="panel.font.label" default="Font" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'font', 'errors')}">
                                    <g:textField name="font" value="${panelInstance?.font}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="menu"><g:message code="panel.menu.label" default="Menu" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'menu', 'errors')}">
                                    
<ul>
<g:each in="${panelInstance?.menu?}" var="m">
    <li><g:link controller="menu" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="menu" action="create" params="['panel.id': panelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'menu.label', default: 'Menu')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="panelSize"><g:message code="panel.panelSize.label" default="Panel Size" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: panelInstance, field: 'panelSize', 'errors')}">
                                    <g:textField name="panelSize" value="${panelInstance?.panelSize}" />
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
