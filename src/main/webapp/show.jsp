<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information List</title>
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
		border: 1px solid black;
		font-size: 16px;
		background-color: white;
	}
</style>
</head>
<body style="background: #D2E9FF">
	<div align="center">
		<h2 style="color: darkred;">Information List</h2>
		<table class="tb">
			<tr>
				<td>Name</td>
				<td>Amount</td>
				<td>Date</td>
				<td>Type</td>
			</tr>
			<c:forEach items="${accounts}" var="item" varStatus="status">		<%-- Pass parameters and call Servlet --%>
				<tr>
					<td>${item.name}</td>
					<td><a>${item.amount}</a></td>
					<td>${item.date}</td>
					<td>${item.type}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="index.jsp">Return to Main Page</a>
	</div>
</body>
</html>
