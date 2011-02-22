<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="preview" />
<title><g:message code="Preview" />
</title>
<g:javascript library="prototype" />


<resource:carousel />
<resource:carousel skin="classic" />
<g:javascript>
function submitOrder() {
	return confirm("sbmit order")
}

function clearOrder() {

	return confirm("clear order")
}

function displaySubMenu(id) {
   ${remoteFunction(action:'displaySubMenuPicture', controller:'admin', params:'\'id=\'+id', update:'center_panel')}
}
</g:javascript>
</head>
<body>
<div id="panel_container" style="background-image: url('${createLink(action:'getBackgroundImage')}?backGroundPicture=${backGroundPicture}');
			background-repeat: no-repeat;background-size:100%;background:${backGroundColor};">


<div id="left_panel"><br />
<br />
<span class="save">
<h3>&nbsp;&nbsp;<a href="javascript:javascript:history.go(-1)">
<font color="Grey" face="Times"> Back to Menu </font></a></h3>
</span> <br />
<br />

<g:each in="${subMenuInstanceList}" status="i" var="subMenuInstance">

	<g:formRemote name="left_form" on404="alert('not found!')"
		url="[action:'getSubMenuItem']" update="bottom_panel">
		<g:hiddenField name="id" value="${subMenuInstance?.id}" />

		<td>&nbsp;&nbsp; <g:actionSubmitImage value="getSubMenuItem"
			update="center_panel"
			src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=subMenu-${subMenuInstance?.id}.${subMenuInstance?.backGroundPictureType}" 
			onclick="return displaySubMenu(${subMenuInstance?.id})"/>
		</td>

		<p>
		<h2>&nbsp;&nbsp;<font color="${subMenuInstance?.fontColor}" face="${subMenuInstance?.fontColor}"> ${fieldValue(bean: subMenuInstance, field: "name")}
		</font></h2>
		</p>
	</g:formRemote>

	<br />
</g:each></div>

<div id="center_panel">
	
	<div id="right_panel">
	

	</div>
	<div id="image_container" style="background-image: url('${createLink(action:'getImage')}?backGroundPicture=${subMenuInstanceList[0]?.backGroundPicture}');
				background-repeat: no-repeat;background-size:100%;">
	<div id="myOrder" style="padding-top:10px;float:right;">
			
			</div>
	</div>


</div>


		<div id="control_panel">
		<g:formRemote name="bottom_form" url="${[action:'selectItem']}" update="myOrder" >
	
		<g:hiddenField name="id" value="${itemInstance?.id}" />			
		&nbsp; &nbsp;		<button><g:actionSubmit class="select" action="clearOrder"
			value="${message(code: 'default.button.clear.order', default: 'Clear Order')}" onclick="return clearOrder()" /></button>
		</g:formRemote>	
		<br/><br/>
		<g:formRemote name="view_form" url="${[action:'viewOrder']}" update="myOrder" >
		&nbsp; &nbsp;	<button><g:actionSubmit class="select" action="viewOrder"
			value="${message(code: 'default.button.view.order', default: 'View My Order')}" /></button>
		</g:formRemote>
	<br/><br/>
	
	<g:form name="submit_form" url="${[action:'submitOrder']}" >
		
		&nbsp; &nbsp;<button><g:actionSubmit class="select" action="submitOrder"
		value="${message(code: 'default.button.submit.order', default: 'Submit Order')}" onclick="return submitOrder()" /></button>
	
		
	</g:>
			
		
</div>



<div id="bottom_panel" >

	<div id="image_">
	
	<richui:carousel direction="horizontal"
		carouselStyle="height:100px"
		itemStyle="height:100px;">
	
		<g:each in="${itemInstanceList}" status="i" var="itemInstance">
			<richui:carouselItem>
				<p>
				<td>
				<h2><font color="${itemInstance?.fontColor}" face="${itemInstance?.font}"> ${fieldValue(bean: itemInstance, field: "name")}
				</font></h2>
				</td>
				</p>
	
	
				<td><g:formRemote name="bottom_form"
					on404="alert('not found!')" url="[action:'displayItem']"
					update="center_panel">
	
					<g:hiddenField name="id" value="${itemInstance?.id}" />
	
					<g:actionSubmitImage value="displayItem" update="center_panel"
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