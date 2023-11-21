<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing the JSTL Core library for JSP -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This line specifies the document type and version of HTML -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- The above line sets the character encoding for the HTML document -->

<title>List Expired Member for Holy Light</title>
<!-- The title of the HTML page -->

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
<!-- Inline CSS styles for defining classes 'a', 'b', 'tb', and 'td' -->

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
<%} %>
<!-- Inline Java code to check and display a message if it exists -->

<div align="center">
	<h2 style="color: darkred;">List Expired Member for Holy Light</h2>
	<!-- Heading with darkred color -->

	<table bordercolor="silver" border="1px" cellspacing="0px" style="border-collapse:collapse">
		<tr bgcolor="#E8E8E8">
			<td>Record&nbsp;Number</td>
			<td>Name</td>
			<td>Amount</td>
			<td>Date</td>
			<td>Type</td>
			<td>Phone</td>
		</tr >
		<c:forEach items="${accounts}" var="item">
		<!-- forEach loop to iterate through the 'accounts' collection passed from the Servlet -->
			<tr bgcolor="white">
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.amount}</td>
				<td>${item.date}</td>
				<td>${item.type}</td>
				<td>${item.phone}</td>
				<!--
				<td><a href="AccountServlet?method=getByname2&id=${item.id}">Modify</a></td>
				<td><a href="AccountServlet?method=getByname&id=${item.id}">Delete</a></td>
				-->
				<!-- Commented out code for 'Modify' and 'Delete' links -->
			</tr>
		</c:forEach>
		<!-- End of forEach loop -->
	</table>
	<!-- Table for displaying account details -->

	<br /><br /> 
	<input type="button"  value="    Print     " onclick="window.location.href='index.jsp'"/>
	<!-- Button for printing, links to 'index.jsp' -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp">Return to Homepage</a>
	<!-- Link to return to the homepage -->
</div>
</body>
</html>
