<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Search</title>
	<!-- The title and character encoding of the HTML page -->

	<style>
		.a {
			margin-top: 20px;
		}
		.b {
			color: black;
		}
		<!-- Inline CSS styles for defining classes 'a' and 'b' -->
	</style>
</head>
<body style="background: #D2E9FF">
<!-- The body of the HTML document with a background color -->

	<%
		Object message = request.getAttribute("message");
		if (message != null && !"".equals(message)) {
	%>
		<script type="text/javascript">
			alert("<%=request.getAttribute("message")%>");
		</script>
		<!-- Inline Java code to check and display a message if it exists -->
	<% } %>
	
	<div align="center">
		<h2 style="color: darkred;">Search</h2>
		<!-- Heading with a specific color -->
		<form action="AccountServlet?method=listByname" method="post" onsubmit="return check()">
		<!-- Form for submitting a name to call a Servlet method -->
			<div>
				Name: <input type="text" id="name" name="name" />
			</div>
			<!-- Text input field for entering a name -->
			<div class="a">
				<button type="submit">Search</button>
			</div>
			<!-- Submit button to initiate the search -->
			<br /><br />
			<a href="index.jsp">Back to Home</a>
		</form>
	</div>
	
	<script type="text/javascript">
		function check() {
			var name = document.getElementById("name");
			// Get the value of the name input field

			// Check if the name field is empty
			if (name.value == '') {
				alert('Name is empty');
				name.focus();
				return false;
			}
		}
	</script>
</body>
</html>
