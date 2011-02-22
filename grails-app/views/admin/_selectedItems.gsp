
<div id="orders" style="height:300px;overflow:auto;width:300px;">

<h2><font color="Black" face="Times">
<td><g:message code="label.my.orders"/> </td> </font></h2> 

<table>
	<g:each in="${orderInstance.itemList}" status="i" var="itemInstance">
	
	
	
	<td> <h3><font color="Black" face="Times">${fieldValue(bean: itemInstance, field: "name")}
	</font></h3> </td>
	
	<td>
			<g:formRemote name="bottom_form" url="${[action:'removeItemFromOrder']}" update="myOrder" >
	
			<g:hiddenField name="id" value="${itemInstance?.id}" />			
			<span class="button"><g:actionSubmit class="select" action="removeItemFromOrder"
			value="${message(code: 'default.button.remove', default: 'remove')}" /></span>
	
	</g:formRemote>	
	
	 </td>
	 <tr/>
</g:each>

</table>


</div>
