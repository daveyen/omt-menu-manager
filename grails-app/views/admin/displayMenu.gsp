<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="preview" />
<title><g:message code="Preview" /></title>
<g:javascript library="prototype" />
</head>

<body>

<g:form>
	<div id="panel_container">
	<div id="left_panel"><br />
	<br />
	<span class="save">
	<h3>&nbsp;&nbsp;<a href="javascript:javascript:history.go(-1)"><font
		color="White" face="Times"> Back </font></a></h3>
	</span> <br />
	<br />

	<g:each in="${menuInstanceList}" status="i" var="menuInstance">


		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			<g:hiddenField name="id" value="${menuInstance?.id}" />
			<td> <g:link action="displaySubMenu" id="${menuInstance.id}">
				&nbsp;&nbsp;<img class="Photo"
					src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=menu-${menuInstance?.id}.${menuInstance?.backGroundPictureType}" />
			</g:link></td>
		</tr>
		<p>
		<td><h2>&nbsp;&nbsp;<font color="Orange" face="Times"> ${fieldValue(bean: menuInstance, field: "name")}
		</font></h2></td>
		</p>
	</g:each></div>

	<div id="center_panel">
	<div id="image_container"><img
		src="${createLink(action:'getImage')}?backGroundPicture=${menuInstanceList[0]?.backGroundPicture}" />
	</div>
	</div>


	<div id="bottom_panel" style="height: 150px;">
		<div id="control_panel">
		</div>
		
		<div id="image_">
		</div>
	</div>
	</div>
</g:form>

</body>



</html>