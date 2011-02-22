<g:javascript library="prototype" />


<div id="image_">


<richui:carousel direction="horizontal" carouselStyle="height:100px;" itemStyle="height:100px">
	<g:each in="${itemInstanceList}" status="i" var="itemInstance">
			<richui:carouselItem>
			<p><td><h2><font color="${itemInstance?.fontColor}" face="${itemInstance?.font}"> ${fieldValue(bean: itemInstance, field: "name")}</font></h2></td></p>

		<span/>			
		<td><g:formRemote name="bottom_form" on404="alert('not found!')"
			url="[action:'displayItem']" update="center_panel">

			<g:hiddenField name="id" value="${itemInstance?.id}" />
				<g:actionSubmitImage value="displayItem" update="center_panel"
					src="${createLink(controller:'image' , action:'getThumbNails')}?image_name=item-${itemInstance?.id}.${itemInstance?.backGroundPictureType}" />
		</g:formRemote></td>
		</richui:carouselItem>
	</g:each>
</richui:carousel>
</div>
