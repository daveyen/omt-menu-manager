<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'Main Menu')}" />
        <title><g:message code="Main Menu" /></title>
    </head>


<body>

<div id="create" style="height:50;">
<table>
	<tr>
		<td><span class="menuButton"><a class="create"
			href="${createLink(uri: '/mainMenu/create')}"><g:message
			code="mainMenu.create" /></a></span> </td>
	</tr>

	<tr>
	<td>
		<span class="menuButton"><a class="list"
			href="${createLink(uri: '/mainMenu/list')}"><g:message
			code="mainMenu.list" /></a></span> </td>
	</tr>
</table>
</div>
</body>

    
    </html>