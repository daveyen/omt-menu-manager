
<%@ page import="menu.manager.Panel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'panel.label', default: 'Panel')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
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
			<td valign="top" class="name"><g:message
				code="mainMenu.backGroundPicture.label"
				default="Back Ground Picture" /></td>
			<g:form controller="image" method="post" action="savePicture"
				enctype="multipart/form-data">

				<g:hiddenField name="id" value="${panelInstance?.id}" />
				<g:hiddenField name="backGroundPicture"
					value="${panelInstance?.backGroundPicture}" />
				<td><img class="Photo"
					src="${createLink(action:'getImage')}?backGroundPicture=${panelInstance?.backGroundPicture}" />
				</td>
		</tr>
		<tr>
			<td/><td> 
			<g:hiddenField name="type" value="panel" />
			<g:hiddenField name="superId" value="${panelInstance?.layouts.id}" />
			<input type="file" name="file" />
			<input type="submit"
				value="${message(code: 'default.button.change.picture', default: 'change picture')}" />
			</td>
			</g:form>
		</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.backGroundPictureType.label" default="Back Ground Picture Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: panelInstance, field: "backGroundPictureType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="panel.layouts.label" default="Layouts" /></td>
                            
                            <td valign="top" class="value"><g:link controller="layouts" action="show" id="${panelInstance?.layouts?.id}">${panelInstance?.layouts?.encodeAsHTML()}</g:link></td>
                            
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
                            <td valign="top" class="name"><g:message code="panel.menu.label" default="Menu" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${panelInstance.menu}" var="m">
                                    <li><g:link controller="menu" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
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
