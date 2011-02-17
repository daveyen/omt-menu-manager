
<%@ page import="menu.manager.Item"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'item.label', default: 'Item')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="body">
<h1><g:message code="default.show.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if>
<div class="dialog">
<table>
	<tbody>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="item.id.label"
				default="Id" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "id")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="item.name.label"
				default="Name" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "name")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="item.type.label"
				default="Type" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "type")}
			</td>

		</tr>

		<g:form controller="image" method="post" action="savePicture"
			enctype="multipart/form-data">

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="item.backGroundPicture.label" default="Back Ground Picture" /></td>

				<g:hiddenField name="id" value="${itemInstance?.id}" />
				<g:hiddenField name="backGroundPicture"
					value="${itemInstance?.backGroundPicture}" />
				<td><img class="Photo"
					src="${createLink(action:'getImage')}?backGroundPicture=${itemInstance?.backGroundPicture}" />
				</td>
			</tr>

			<tr>
				<td>
				<td />
				<g:hiddenField name="type" value="item" />
				<g:hiddenField name="superId" value="${itemInstance?.subMenu.id}" />
				<input type="file" name="file" />
				<input type="submit"
					value="${message(code: 'default.button.change.picture', default: 'change picture')}" />
				</td>
			</tr>
		</g:form>




		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="item.backGroundPictureType.label"
				default="Back Ground Picture Type" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "backGroundPictureType")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="item.subMenu.label" default="Sub Menu" /></td>

			<td valign="top" class="value"><g:link controller="subMenu"
				action="show" id="${itemInstance?.subMenu?.id}">
				${itemInstance?.subMenu?.encodeAsHTML()}
			</g:link></td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="item.backGroundColor.label" default="Back Ground Color" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "backGroundColor")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="item.description.label" default="Description" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "description")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="item.font.label"
				default="Font" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "font")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="item.fontColor.label" default="Font Color" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "fontColor")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="item.price.label"
				default="Price" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "price")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="item.title.label"
				default="Title" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: itemInstance, field: "title")}
			</td>

		</tr>

	</tbody>
</table>
</div>
<div class="buttons"><g:form>
	<g:hiddenField name="id" value="${itemInstance?.id}" />
	<span class="button"><g:actionSubmit class="edit" action="edit"
		value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
	<span class="button"><g:actionSubmit class="delete"
		action="delete"
		value="${message(code: 'default.button.delete.label', default: 'Delete')}"
		onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
</g:form></div>
</div>
</body>
</html>
