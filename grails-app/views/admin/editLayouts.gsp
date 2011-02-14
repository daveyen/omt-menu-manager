

<%@ page import="menu.manager.Layouts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'layouts.label', default: 'Layouts')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${layoutsInstance}">
            <div class="errors">
                <g:renderErrors bean="${layoutsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${layoutsInstance?.id}" />
                <g:hiddenField name="version" value="${layoutsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="layouts.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: layoutsInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${layoutsInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="admin"><g:message code="layouts.admin.label" default="Admin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: layoutsInstance, field: 'admin', 'errors')}">
                                    <g:select name="admin.id" from="${menu.manager.Admin.list()}" optionKey="id" value="${layoutsInstance?.admin?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="panel"><g:message code="layouts.panel.label" default="Panel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: layoutsInstance, field: 'panel', 'errors')}">
                                    
<ul>
<g:each in="${layoutsInstance?.panel?}" var="p">
    <li><g:link controller="panel" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="panel" action="create" params="['layouts.id': layoutsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'panel.label', default: 'Panel')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updateLayouts" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="deleteLayouts" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
