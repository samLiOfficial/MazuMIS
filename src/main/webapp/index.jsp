<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<style >
	.a{
		font-size: 24px;
		margin-top: 20px;
	}
	.b{
		font-size: 24px;
		width: 400px;
    	height: 50px;
		color: darkred;
		border-radius: 20px;
	}
</style>



</head>
<body style="background:#ECF5FF">
<div align="center">
  <h1 style="color: crimson;">Canada Mazu MIS</h1>
  <h2 style="color: darkred;">Donation Management System - Canada-China Mazu Association</h2>
  
  <img src="mazu.png" width="100" height="100" />    <%--Show the LOGO PNG--%>

  <div class="a">
    <input type="button" class="b" value="Record Donation" onclick="window.location.href='add.jsp'"/>
  </div>

  <div class="a">
    <input type="button" class="b" value="Search By Name/ID" onclick="window.location.href='selectbyname.jsp'"/>
  </div>

  <div class="a">
    <input type="button" class="b" value="List by Time Interval" onclick="window.location.href='selectbydate.jsp'"/>
  </div>

  <div class="a">
    <input type="button" class="b" value="List All Donation" onclick="window.location.href='AccountServlet?method=list'"/>
  </div>

  <div class="a">
    <input type="button" class="b" value="Top Ten Donor Board" onclick="window.location.href='AccountServlet?method=list_sorted_FirstTen'"/>
  </div>

  <div class="a">
    <input type="button" class="b" value="Donor Ranking Board" onclick="window.location.href='AccountServlet?method=list_sorted'"/>
  </div>
  
  <div class="a">
    <input type="button" class="b" value="Summary" onclick="window.location.href='AccountServlet?method=summary'"/>
  </div>

  <div class="a">
    <input type="button" class="b" value="Expired Member List" onclick="window.location.href='AccountServlet?method=list_expire_member'"/>
  </div>

  <div style="font-size: 10px; position: absolute; bottom: 10px; right: 10px;">by SamLi.2022</div>
</div>
</body>
</html>