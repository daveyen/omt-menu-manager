<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="preview" />
		<title><g:message code="Submit Success" /></title>
	</head>
	<body>
		
			<div id="panel_container" style="background-image: url('../images/sand_clock2.jpg');
			background-repeat: no-repeat;background-size:100%;">
			
				<div>
					<g:form action="getMyBill">
					<div id="myBill" style="float:right;margin-right:5%;margin-top:50%;">		
				 	<button style="height:50px;width:100px;"><g:actionSubmit class="save" action="getMyBill" value="${message(code: 'My Bill')}" /></button>
				 	</div>
				 	</g:form>
				 </div>
				 
				 <div id="success" style="font-size:300%; valign:center;margin-top:150px;margin-left:30px;margin-right:30px">
			<font color="Orange" face="Times">Order submitted Successfully.
				 The order will be arriving soon. Please tap on "My bill" to get your bill. Thank you.</font>
			</div>
			</div>
		
	</body>

</html>





