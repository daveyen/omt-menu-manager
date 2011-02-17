<%@ page import="menu.manager.Item"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'mainMenu.label', default: 'Main Menu')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<g:form controller="image" method="post" action="savePicture"
	enctype="multipart/form-data">
	<g:hiddenField name="id" value="${mainMenuInstance?.id}" />
	<g:hiddenField name="type" value="mainMenu" />
	<g:hiddenField name="superId" value="${mainMenuInstance?.layouts.id}" />
	
	<input type="file" name="file" />
	<input type="submit" />

</g:form>
<g:form>
	<g:hiddenField name="id" value="${mainMenuInstance?.id}" />
	<span class="button"><g:actionSubmit class="save" controller='mainMenu' action="show"
		value="${message(code: 'default.button.skip.label', default: 'Skip')}" /></span>
		</g:form>
<div class="buttons"><g:form>
	<g:hiddenField name="id" value="${mainMenuInstance?.id}" />
	<span class="button"><g:actionSubmit class="edit" action="edit"
		value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
	<span class="button"><g:actionSubmit class="delete"
		action="delete"
		value="${message(code: 'default.button.delete.label', default: 'Delete')}"
		onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
</g:form></div>
</body
</html>