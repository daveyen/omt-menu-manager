
<div id="right_panel">

<div id="select" style="padding-top:10px;">

	<g:formRemote name="center_form" url="${[action:'selectItem']}" update="myOrder" >
	
	<g:hiddenField name="id" value="${itemInstance?.id}" />			
		<span class="button"><g:actionSubmit class="select" action="selectItem"
		value="${message(code: 'default.button.select.label', default: 'select')}" /></span>
		
	</g:formRemote>
	

</div>
<div style="width=150px; padding-top:10px;" >


		<tr class="prop">
			<td valign="top" class="value">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			${fieldValue(bean: itemInstance, field: "title")} </font></h3>
			</td>

		</tr>
		
<table>
	<tbody>

		<tr class="prop">
		
			<td valign="top" class="name">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			
			<g:message code="item.name.label"
				default="Name" /> 
				
						  <g:message code="item.title.seperator" default="  :  " /> </font></h3>
				</td>

			<td valign="top" class="value">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			
			${fieldValue(bean: itemInstance, field: "name")} </font></h3>
			</td>

		</tr>

		<tr class="prop">
				<td valign="top" class="name">
				<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
				<g:message code="item.type.label"
				default="Type" /> 	  <g:message code="item.title.seperator" default="  :  " />  </font></h3>
				</td>

			<td valign="top" class="value">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			${fieldValue(bean: itemInstance, field: "type")} </font></h3>
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			<g:message code="item.price.label" default="Price" />
				<g:message code="item.title.seperator" default="  :  " /> </font></h3>
				</td>
	  
			<td valign="top" class="value">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			${fieldValue(bean: itemInstance, field: "price")}  </font></h3>
			</td>

		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			<g:message code="item.description.label" default="Description" />
					  <g:message code="item.title.seperator" default="  :  " />  </font></h3>
				</td>


			<td valign="top" class="value">
			<h3><font color="${itemInstance?.fontColor }" face="${itemInstance?.fontColor }">
			${fieldValue(bean: itemInstance, field: "description")} </font></h3>
			</td>

		</tr>
		


</tbody></table>
</div>

	
</div>


<div id="image_container"
	style="background-image: url('${createLink(action:'getImage')}?backGroundPicture=${itemInstance?.backGroundPicture}');
			background-repeat: no-repeat;background-size:100%;">
			
			<div id="myOrder" style="padding-top:10px;float:right;">
			
			</div>
			


</div>

