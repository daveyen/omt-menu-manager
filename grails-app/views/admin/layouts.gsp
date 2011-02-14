<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'layouts.label', default: 'Layouts')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<div id="create" style="height:50;">
<table>
	<tr>
		<td><span class="menuButton"><a class="create"
			href="${createLink(uri: '/admin/createLayouts')}"><g:message
			code="admin.layouts.create" /></a></span> </td>
	</tr>

	<tr>
	<td>
		<span class="menuButton"><a class="list"
			href="${createLink(uri: '/admin/listLayouts')}"><g:message
			code="admin.layouts.list" /></a></span> </td>
	</tr>
</table>
</div>
</body>

</html>