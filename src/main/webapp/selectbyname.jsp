<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Search</title>
	<style>
		.a {
			margin-top: 20px;
		}
		.b {
			color: black;
		}
	</style>
</head>
<body style="background: #D2E9FF">
	<%
		Object message = request.getAttribute("message");
		if (message != null && !"".equals(message)) {
	%>
	<script type="text/javascript">
		alert("<%=request.getAttribute("message")%>");
	</script>
	<% } %>
	
	<div align="center">
		<h2 style="color: darkred;">Search</h2>
		<form action="AccountServlet?method=listByname" method="post" onsubmit="return check()"> <%--the form starts --%>
			<div>
				Name: <input type="text" id="name" name="name" />
			</div>
			<div class="a">
				<button type="submit">Search</button>
			</div>
			<br /><br />
			<a href="index.jsp">Back to Home</a>
		</form>
	</div>
	
	<script type="text/javascript">
		function check() {
			var name = document.getElementById("name");
			if (name.value == '') {
				alert('Name is empty');
				name.focus();
				return false;
			}
		}
	</script>
</body>
</html>
