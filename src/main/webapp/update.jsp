<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h2 style="color: darkred;">Edit Information</h2>
		<form action="AccountServlet?method=update" method="post" onsubmit="return check()">   <%-- Pass parameters and call the Servlet --%>
		
			<div class="a">
				ID<input type="text"  id="id" name="id" value="${account.id}" readonly/>
			</div>
			<div class="a">
				Name<input type="text"  id="name" name="name" value="${account.name}"/>
			</div>
			<div class="a">
				Amount<input type="text" id="amount" name="amount" value="${account.amount}"/>
			</div>
			<div class="a">
				Date<input type="text" id="date" name="date" value="${account.date}"/>
			</div>
			<div class="a">
				Type<input type="text"  name="type" value="${account.type}"/>
			 </div>
			<div class="a">
				Phone<input type="text"  name="phone" value="${account.phone}"/>
			</div>
			<div class="a">
				<button type="submit" class="b">Edit</button>
			</div>
		</form>
		<br /><br />
		<a href="index.jsp">Back to Homepage</a>

	</div>
	<script type="text/javascript">
		function check() {
			var b = document.getElementById("amount");
			var c = document.getElementById("date");
			
			<%-- Check if some data fields are empty --%>
			if(b.value == '') {
				alert('Amount is empty');
				b.focus();
				return false;
			}
			if(c.value == '') {
				alert('Date is empty');
				c.focus();
				return false;
			}
		}
	</script>
</body>
</html>
