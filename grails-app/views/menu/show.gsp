
<%@ page import="menu.manager.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
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
                            <td valign="top" class="name"><g:message code="menu.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "name")}</td>
                            
                        </tr>
                    
		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="menu.backGroundPicture.label"
				default="Back Ground Picture" /></td>
			<g:form controller="image" method="post" action="savePicture"
				enctype="multipart/form-data">

				<g:hiddenField name="id" value="${menuInstance?.id}" />
				<g:hiddenField name="backGroundPicture"
					value="${menuInstance?.backGroundPicture}" />
				<td><img class="Photo"
					src="${createLink(action:'getImage')}?backGroundPicture=${menuInstance?.backGroundPicture}" />
				</td>
		</tr>
		<tr>
			<td><td/>
			<g:hiddenField name="type" value="menu" />
			<g:hiddenField name="superId" value="${menuInstance?.mainMenu.id}" />
			<input type="file" name="file" />
			<input type="submit"
				value="${message(code: 'default.button.change.picture', default: 'change picture')}" />
			</td>
			</g:form>
		</tr>

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.backGroundPictureType.label" default="Back Ground Picture Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "backGroundPictureType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.mainMenu.label" default="Main Menu" /></td>
                            
                            <td valign="top" class="value"><g:link controller="mainMenu" action="show" id="${menuInstance?.mainMenu?.id}">${menuInstance?.mainMenu?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.panel.label" default="Panel" /></td>
                            
                            <td valign="top" class="value"><g:link controller="panel" action="show" id="${menuInstance?.panel?.id}">${menuInstance?.panel?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.backGroundColor.label" default="Back Ground Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "backGroundColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.font.label" default="Font" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "font")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.fontColor.label" default="Font Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "fontColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.subMenu.label" default="Sub Menu" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${menuInstance.subMenu}" var="s">
                                    <li><g:link controller="subMenu" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "title")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${menuInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
