<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="preview" />
		<title><g:message code="Preview" /></title>
	</head>
	<body>
		<g:form action="displayMenu">
			<div id="panel_container">
				<div id="left_panel"> </div>
		
				<div id="center_panel">
					<div id="image_container"><img class="Photo"
						src="${createLink(action:'getImage')}?backGroundPicture=${mainMenuInstance?.backGroundPicture}" />
					</div>
					<g:hiddenField name="id" value="${mainMenuInstance?.id}" />
				 	<g:actionSubmit class="save" action="displayMenu" value="${message(code: 'default.button.enter', default: 'Enter')}" />
				</div>
				<div id="bottom_panel"> </div>
				
			</div>
		</g:form>
	</body>

</html>





