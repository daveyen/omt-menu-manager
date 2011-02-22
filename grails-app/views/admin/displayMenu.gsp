<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="preview" />
<title><g:message code="Preview" /></title>
<g:javascript library="prototype" />


<g:javascript>
function submitOrder() {
	return confirm("sbmit order")
}

function clearOrder() {

	return confirm("clear order")
}
</g:javascript>

</head>

<body>


	<div id="panel_container" style="background-image: url('${createLink(action:'getBackgroundImage')}?backGroundPicture=${backGroundPicture}');
			background-repeat: no-repeat;background-size:100%;background:${backGroundColor};">
	<div id="left_panel">
	<br />
	<br />
	<span class="save">
	<h3>&nbsp;&nbsp;<a href="javascript:javascript:history.go(-1)"><font
		color="grey" face="Times"> Back </font></a></h3>
	</span> <br />
	<br />

	<g:each in="${menuInstanceList}" status="i" var="menuInstance">


		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			<g:hiddenField name="id" value="${menuInstance?.id}" />
			<td><g:link action="displaySubMenu" id="${menuInstance.id}">
				&nbsp;&nbsp;<img class="Photo"
					src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=menu-${menuInstance?.id}.${menuInstance?.backGroundPictureType}" />
			</g:link></td>
		</tr>
		<p>
		<td>
		<h2>&nbsp;&nbsp;<font color="${menuInstance?.fontColor}" face="${menuInstance?.font}"> ${fieldValue(bean: menuInstance, field: "name")}
		</font></h2>
		</td>
		</p>
		<br />
	</g:each></div>

	<div id="center_panel">
	<div id="right_panel">

	</div>

	<div id="image_container" style="background-image: url('${createLink(action:'getImage')}?backGroundPicture=${menuInstanceList[0]?.backGroundPicture}');
			background-repeat: no-repeat;background-size:100%;">
				<div id="myOrder"></div>
			
	</div>
	</div>

	<div id="control_panel"><g:formRemote name="bottom_form"
		url="${[action:'selectItem']}" update="myOrder">

		<g:hiddenField name="id" value="${itemInstance?.id}" />
		<span class="button"><g:actionSubmit class="select"
			action="clearOrder"
			value="${message(code: 'default.button.clear.order', default: 'Clear Order')}" onclick=" return clearOrder()"/></span>

	</g:formRemote> 
	<br/><br/>
	<g:formRemote name="view_form" url="${[action:'viewOrder']}"
		update="myOrder">

		<span class="button"><g:actionSubmit class="select"
			action="viewOrder"
			value="${message(code: 'default.button.view.order', default: 'View My Order')}" /></span>

	</g:formRemote>

<br/><br/>
<g:formRemote name="submit_form" url="${[action:'submitOrder']}" update="image_container" >
		
		<span class="button"><g:actionSubmit class="select" action="submitOrder"
		value="${message(code: 'default.button.submit.order', default: 'Submit Order')}" onclick="return submitOrder()"/></span>
	
		
	</g:formRemote>
</div>


	<div id="bottom_panel" style="height: 150px;">

	<div id="image_"></div>
	</div>
	</div>


</body>



</html>