<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Account Ranking List</title>
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
			border: 1px solid black;
			font-size: 16px;
			background-color: white;
		}
	</style>
</head>
<body style="background: #D2E9FF">
	<div align="center">
		<h2 style="color: darkred;">Account Ranking List - Top 10 Highest</h2>
		<table class="tb">
			<tr>
				<td>Ranking</td>
				<td>Name</td>
				<td>Amount</td>
				<td>Date</td>
				<td>Type</td>
			</tr>
			<!-- forEach loop to iterate over adminBeans -->
			<c:forEach items="${accounts}" var="item" varStatus="status">
				<c:if test="${status.index < 10}">
					<tr>
						<td>${status.index + 1}</td>
						<td>${item.name}</td>
						<td>${item.amount}</td>
						<td>${item.date}</td>
						<td>${item.type}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<a href="index.jsp">Back to Home</a>
	</div>
</body>
</html>
