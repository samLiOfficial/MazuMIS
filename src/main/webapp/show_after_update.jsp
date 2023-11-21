<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Modified Information</title>
	<!-- The title and character encoding of the HTML page -->

	<style>
		.a {
			margin-top: 20px;
		}
		.b {
			font-size: 20px;
			width: 160px;
			color: white;
			background-color: greenyellow;
		}
		.tb, td {
			font-size: 16px;
			padding:5px;
		}
		<!-- Inline CSS styles for defining classes 'a', 'b', 'tb', and 'td' -->
	</style>
</head>
<body style="background: #D2E9FF">
<!-- The body of the HTML document with a background color -->

	<%
		Object message = request.getAttribute("message");
		if(message!=null && !"".equals(message)){
	%>
		<script type="text/javascript">
			alert("<%=request.getAttribute("message")%>");
		</script>
		<!-- Inline Java code to check and display a message if it exists -->
	<% } %>
	
	<div align="center">
		<h2 style="color: darkred;">Modified Information</h2>
		<!-- Heading with a specific color -->
		<table bordercolor="silver" border="1px" cellspacing="0px" style="border-collapse:collapse">
		<!-- Table with border properties -->
			<tr>
				<td bgcolor="#E8E8E8">Name</td>
				<!-- Table cell for displaying 'Name' with a specific background color -->
				<td bgcolor="white">${account.name}</td>
				<!-- Table cell for displaying account name -->
			</tr>
			<tr>
				<td bgcolor="#E8E8E8">Amount</td>
				<!-- Table cell for displaying 'Amount' with a specific background color -->
				<td bgcolor="white">${account.amount}</td>
				<!-- Table cell for displaying account amount -->
			</tr>
			<tr>
				<td bgcolor="#E8E8E8">Date</td>
				<!-- Table cell for displaying 'Date' with a specific background color -->
				<td bgcolor="white">${account.date}</td>
				<!-- Table cell for displaying account date -->
			</tr>
			<tr>
				<td bgcolor="#E8E8E8">Type</td>
				<!-- Table cell for displaying 'Type' with a specific background color -->
				<td bgcolor="white">${account.type}</td>
				<!-- Table cell for displaying account type -->
			</tr>
		</table>
		<br /><br />
		<a href="index.jsp">Back to Home</a>
		<!-- Link to return to the home page -->
	</div>
</body>
</html>
