<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String date= format.format(new Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style>
	.a{
		margin-top: 20px;
	}
	.b{
		color: black;
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
<h2 style="color: darkred;"> Find </h2>
		<form action="AccountServlet?method=listBydate" method="post" onsubmit="return check()">    <%--传递参数，调用Servlet--%>

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
			
			<%--check if the name field is empty--%>
			if(name.value == '') {
				alert('Name Can Not Be Empty');
				name.focus();
				return false;
			}
		}
	</script>
</body>
</html>
