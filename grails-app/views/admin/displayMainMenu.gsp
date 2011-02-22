<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="preview" />
		<title><g:message code="Preview" /></title>
	</head>
	<body>
		<g:form action="displayMenu">
			<div id="panel_container" style="background-image: url('${createLink(action:'getBackgroundImage')}?backGroundPicture=${mainMenuInstance?.backGroundPicture}');
			background-repeat: no-repeat;background-size:100%;">
					<!--<div style="height:90%; width:100%"></div>
					--><div id="enter" style="float:right;margin-right:5%;margin-top:50%;">		
					<g:hiddenField name="id" value="${mainMenuInstance?.id}" />
				 	<button style="height:50px;width:100px;"><g:actionSubmit class="save" action="displayMenu" value="${message(code: 'default.button.enter', default: 'Enter')}" /></button>
				 	</div>
			</div>
		</g:form>
	</body>

</html>





