<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="preview" />
<title><g:message code="Preview" />
</title>
<g:javascript library="prototype" />


<resource:carousel />
<resource:carousel skin="classic" />

</head>
<body>
<div id="panel_container">

<div id="left_panel"><br />
<br />
<span class="save">
<h3>&nbsp;&nbsp;<a href="javascript:javascript:history.go(-1)">
<font color="White" face="Times"> Back to Menu </font></a></h3>
</span> <br />
<br />

<g:each in="${subMenuInstanceList}" status="i" var="subMenuInstance">

	<g:formRemote name="left_form" on404="alert('not found!')"
		url="[action:'getSubMenuItem']" update="bottom_panel">
		<g:hiddenField name="id" value="${subMenuInstance?.id}" />

		<td>&nbsp;&nbsp; <g:actionSubmitImage value="getSubMenuItem"
			update="center_panel"
			src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=subMenu-${subMenuInstance?.id}.${subMenuInstance?.backGroundPictureType}" />
		</td>

		<p>
		<h2>&nbsp;&nbsp;<font color="Orange" face="Times"> ${fieldValue(bean: subMenuInstance, field: "name")}
		</font></h2>
		</p>
	</g:formRemote>

	<br />
</g:each></div>

<div id="center_panel">
	<div id="right_panel"">

	</div>
	<div id="image_container" style="background-image: url('${createLink(action:'getImage')}?backGroundPicture=${subMenuInstanceList[0]?.backGroundPicture}');
				background-repeat: no-repeat;">
	</div>


</div>

<div id="bottom_panel" >
		<div id="control_panel">
		</div>

	<div id="image_">
	
	<richui:carousel direction="horizontal"
		carouselClass="background-color:black;"
		carouselStyle="background-color:black;height:100px"
		itemStyle="background:black;height:100px;float:middle;">
	
		<g:each in="${itemInstanceList}" status="i" var="itemInstance">
			<richui:carouselItem>
				<p>
				<td>
				<h2><font color="Orange" face="Times"> ${fieldValue(bean: itemInstance, field: "name")}
				</font></h2>
				</td>
				</p>
	
	
				<td><g:formRemote name="bottom_form"
					on404="alert('not found!')" url="[action:'displayItem']"
					update="center_panel">
	
					<g:hiddenField name="id" value="${itemInstance?.id}" />
	
					<g:actionSubmitImage value="displayItem" update="ceneter_panel"
						src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=item-${itemInstance?.id}.${itemInstance?.backGroundPictureType}" />
				</g:formRemote></td>
			</richui:carouselItem>
	
		</g:each>
	</richui:carousel>
	</div>
</div>
</div>

</body>

</html>