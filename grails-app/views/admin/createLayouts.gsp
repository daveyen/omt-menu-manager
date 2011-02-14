

<%@ page import="menu.manager.Layouts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'layouts.label', default: 'Layouts')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${layoutsInstance}">
            <div class="errors">
                <g:renderErrors bean="${layoutsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="saveLayouts" >
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="saveLayouts" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
