

<%@ page import="menu.manager.Item"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'item.label', default: 'Item')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class="body">
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if> <g:hasErrors bean="${itemInstance}">
	<div class="errors"><g:renderErrors bean="${itemInstance}"
		as="list" /></div>
</g:hasErrors> <g:form method="post">
	<g:hiddenField name="id" value="${itemInstance?.id}" />
	<g:hiddenField name="version" value="${itemInstance?.version}" />
	<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><label for="name"><g:message
					code="item.name.label" default="Name" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'name', 'errors')}">
				<g:textField name="name" value="${itemInstance?.name}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="type"><g:message
					code="item.type.label" default="Type" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'type', 'errors')}">
				<g:select name="type" from="${itemInstance.constraints.type.inList}"
					value="${itemInstance?.type}" valueMessagePrefix="item.type" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="backGroundPicture"><g:message
					code="item.backGroundPicture.label" default="Back Ground Picture" /></label>
				</td>
				<td><img class="Photo" src="${createLink(action:'getImage')}?backGroundPicture=${itemInstance?.backGroundPicture}" />
				<span class="button"><g:actionSubmit class="save" action="uploadPicture"
					value="${message(code: 'default.button.change.picture', default: 'change picture')}" /></span></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="subMenu"><g:message
					code="item.subMenu.label" default="Sub Menu" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'subMenu', 'errors')}">
				<g:select name="subMenu.id" from="${menu.manager.SubMenu.list()}"
					optionKey="id" value="${itemInstance?.subMenu?.id}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="backGroundColor"><g:message
					code="item.backGroundColor.label" default="Back Ground Color" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'backGroundColor', 'errors')}">
				<g:textField name="backGroundColor"
					value="${itemInstance?.backGroundColor}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="description"><g:message
					code="item.description.label" default="Description" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'description', 'errors')}">
				<g:textField name="description" value="${itemInstance?.description}" />
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="font"><g:message
					code="item.font.label" default="Font" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'font', 'errors')}">
				<g:textField name="font" value="${itemInstance?.font}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="fontColor"><g:message
					code="item.fontColor.label" default="Font Color" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'fontColor', 'errors')}">
				<g:textField name="fontColor" value="${itemInstance?.fontColor}" />
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="price"><g:message
					code="item.price.label" default="Price" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'price', 'errors')}">
				<g:textField name="price" value="${itemInstance?.price}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="title"><g:message
					code="item.title.label" default="Title" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: itemInstance, field: 'title', 'errors')}">
				<g:textField name="title" value="${itemInstance?.title}" /></td>
			</tr>

		</tbody>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:actionSubmit
		class="save" action="update"
		value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
	<span class="button"><g:actionSubmit class="delete"
		action="delete"
		value="${message(code: 'default.button.delete.label', default: 'Delete')}"
		onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
	</div>
</g:form></div>
</body>
</html>
