<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing JSTL core taglib for use in JSP -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Setting the character encoding of the HTML page -->

	<title>Account Ranking List</title>
	<!-- The title of the HTML page -->

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
		<!-- Inline CSS styles for defining classes 'a', 'b', 'tb', and 'td' -->
	</style>
</head>
<body style="background: #D2E9FF">
<!-- The body of the HTML document with a background color -->

	<div align="center">
		<h2 style="color: darkred;">Account Ranking List - Top 10 Highest</h2>
		<!-- Heading with a specific color -->

		<table class="tb">
		<!-- Table with class 'tb' for styling -->
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
					<!-- Checking if the index is less than 10 to display the top 10 -->
					<tr>
						<td>${status.index + 1}</td>
						<!-- Displaying the ranking -->
						<td>${item.name}</td>
						<!-- Displaying the name -->
						<td>${item.amount}</td>
						<!-- Displaying the amount -->
						<td>${item.date}</td>
						<!-- Displaying the date -->
						<td>${item.type}</td>
						<!-- Displaying the type -->
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<!-- End of the table -->
		<a href="index.jsp">Back to Home</a>
		<!-- Link to return to the home page -->
	</div>
</body>
</html>
