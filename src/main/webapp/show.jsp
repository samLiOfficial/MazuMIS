<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing JSTL core taglib for use in JSP -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Setting the character encoding of the HTML page -->

<title>Information List</title>
<!-- The title of the HTML page -->

<style>
	.a{
		margin-top: 20px;
	}
	<!-- Inline CSS styles for defining class 'a' -->
	.b{
		font-size: 20px;
		width: 160px;
		color: white;
		background-color: greenyellow;
	}
	<!-- Inline CSS styles for defining class 'b' -->
	.tb, td {
		border: 1px solid black;
		font-size: 16px;
		background-color: white;
	}
	<!-- Inline CSS styles for defining classes 'tb' and 'td' -->
</style>
</head>
<body style="background: #D2E9FF">
<!-- The body of the HTML document with a background color -->

	<div align="center">
		<h2 style="color: darkred;">Information List</h2>
		<!-- Heading with a specific color -->

		<table class="tb">
		<!-- Table with class 'tb' for styling -->
			<tr>
				<td>Name</td>
				<!-- Table header cell for Name -->
				<td>Amount</td>
				<!-- Table header cell for Amount -->
				<td>Date</td>
				<!-- Table header cell for Date -->
				<td>Type</td>
				<!-- Table header cell for Type -->
			</tr>
			<!-- forEach loop to iterate over accounts -->
			<c:forEach items="${accounts}" var="item" varStatus="status">	
				<tr>
					<td>${item.name}</td>
					<!-- Displaying the name of the item -->
					<td><a>${item.amount}</a></td>
					<!-- Displaying the amount of the item -->
					<td>${item.date}</td>
					<!-- Displaying the date of the item -->
					<td>${item.type}</td>
					<!-- Displaying the type of the item -->
				</tr>
			</c:forEach>
		</table>
		<!-- End of the table -->
		<a href="index.jsp">Return to Main Page</a>
		<!-- Link to return to the main page -->
	</div>
</body>
</html>
