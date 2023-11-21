<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding and importing Java utilities -->

<%@page import="java.text.SimpleDateFormat"%>
<!-- Importing the SimpleDateFormat class from Java -->

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String date= format.format(new Date());
%>
<!-- Java code for getting the current date and creating a base path -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This line specifies the document type and version of HTML -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- The title of the HTML page -->

<style>
	.a{
		margin-top: 20px;
	}
	.b{
		color: black;
	}
</style>
<!-- Inline CSS styles for defining classes 'a' and 'b' -->

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
<h2 style="color: darkred;"> Find </h2>
	<form action="AccountServlet?method=listBydate" method="post" onsubmit="return check()">
	<!-- Form for submitting a date range to call a Servlet method -->

	<div >From Date <input type="text" id="start_date" name="start_date" value="<%=date%>"/> </div>
	<div >To Date<input type="text" id="end_date" name="end_date" value="<%=date%>"/> </div>
	
		<div class="a">
			 <button type="submit" >Find</button>
		</div>
		
	<br /> <br />
	<a href="index.jsp">Back to Menu</a>
	</form>
</div>
<script type="text/javascript">
	function check() {
		var name = document.getElementById("name");
		
		// Check if the name field is empty
		if(name.value == '') {
			alert('Name Can Not Be Empty');
			name.focus();
			return false;
		}
	}
</script>
</body>
</html>
