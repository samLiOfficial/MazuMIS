<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.a{
		margin-top: 20px;
	}
	.b{
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
	<%} %>
	<div align="center">
		<h2 style="color: darkred;">Bill List</h2>
		<table bordercolor="silver" border="1px" cellspacing="0px" style="border-collapse:collapse">
			<tr bgcolor="#E8E8E8">
				<td>Record Number</td>
				<td>Name</td>
				<td>Amount</td>
				<td>Date</td>
				<td>Category</td>
				<td align="center" colspan="2">Action</td>
			</tr>
			<c:forEach items="${accounts}" var="item">		<!-- Loop through and display data returned from Servlet -->
				<tr bgcolor="white">
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>${item.amount}</td>
					<td>${item.date}</td>
					<td>${item.type}</td>
					<td><a href="AccountServlet?method=getByid_For_Update&id=${item.id}">Edit</a></td>	<!-- Pass parameters to call the Servlet -->
					<td><a href="AccountServlet?method=getByid_For_Delete&id=${item.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
		<br /><br /> 
		
			<input type="button"  value="Print" onclick="window.location.href='index.jsp'"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="index.jsp">Back to Home</a>
	</div>
</body>
</html>
