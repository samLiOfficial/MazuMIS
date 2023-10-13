<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Modified Information</title>
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
	</style>
</head>
<body style="background: #D2E9FF">
	<%
		Object message = request.getAttribute("message");
		if(message!=null && !"".equals(message)){
	%>
	<script type="text/javascript">
		alert("<%=request.getAttribute("message")%>");
	</script>
	<% } %>
	<div align="center">
		<h2 style="color: darkred;">Modified Information</h2>
		<table bordercolor="silver" border="1px" cellspacing="0px" style="border-collapse:collapse">
			<tr>
				<td bgcolor="#E8E8E8">Name</td>
				<td bgcolor="white">${account.name}</td>
			</tr>
			<tr>
				<td bgcolor="#E8E8E8">Amount</td>
				<td bgcolor="white">${account.amount}</td>
			</tr>
			<tr>
				<td bgcolor="#E8E8E8">Date</td>
				<td bgcolor="white">${account.date}</td>
			</tr>
			<tr>
				<td bgcolor="#E8E8E8">Type</td>
				<td bgcolor="white">${account.type}</td>
			</tr>
		</table>
		<br /><br />
		<a href="index.jsp">Back to Home</a>
	</div>
</body>
</html>
