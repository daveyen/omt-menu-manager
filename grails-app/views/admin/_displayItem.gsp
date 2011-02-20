
<div id="right_panel"><g:formRemote name="center_form"
	url="${[action:'show']}">
	<g:hiddenField name="id" value="${itemInstance?.id}" />
	<span class="button" style="float: middle;"><g:actionSubmit
		class="save" action="update"
		value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>

</g:formRemote></div>


<div id="image_container"
	style="background-image: url('${createLink(action:'getImage')}?backGroundPicture=${itemInstance?.backGroundPicture}');
			background-repeat: no-repeat;">


</div>

