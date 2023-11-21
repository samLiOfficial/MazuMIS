<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This line specifies the document type and version of HTML -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- The above line sets the character encoding for the HTML document -->

<title>Main</title>
<!-- The title of the HTML page -->

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
<!-- Inline CSS styles for defining classes 'a' and 'b' -->

</head>
<body style="background:#ECF5FF">
<!-- The body of the HTML document with a background color -->

<div align="center">
  <h1 style="color: crimson;">Canada Mazu MIS</h1>
  <!-- Heading with crimson color -->

  <h2 style="color: darkred;">Donation Management System - Canada-China Mazu Association</h2>
  <!-- Sub-heading with darkred color -->

  <img src="mazu.png" width="100" height="100" />    <%--Show the LOGO PNG--%>
  <!-- Image tag for displaying a logo image -->

  <div class="a">
    <input type="button" class="b" value="Record Donation" onclick="window.location.href='add.jsp'"/>
  </div>
  <!-- Button for recording donations with an 'onclick' event -->

  <div class="a">
    <input type="button" class="b" value="Search By Name/ID" onclick="window.location.href='selectbyname.jsp'"/>
  </div>
  <!-- Button for searching by name/ID with an 'onclick' event -->

  <div class="a">
    <input type="button" class="b" value="List by Time Interval" onclick="window.location.href='selectbydate.jsp'"/>
  </div>
  <!-- Button for listing by time interval with an 'onclick' event -->

  <div class="a">
    <input type="button" class="b" value="List All Donation" onclick="window.location.href='AccountServlet?method=list'"/>
  </div>
  <!-- Button for listing all donations with an 'onclick' event -->

  <div class="a">
    <input type="button" class="b" value="Top Ten Donor Board" onclick="window.location.href='AccountServlet?method=list_sorted_FirstTen'"/>
  </div>
  <!-- Button for displaying the top ten donor board with an 'onclick' event -->

  <div class="a">
    <input type="button" class="b" value="Donor Ranking Board" onclick="window.location.href='AccountServlet?method=list_sorted'"/>
  </div>
  <!-- Button for displaying the donor ranking board with an 'onclick' event -->
  
  <div class="a">
    <input type="button" class="b" value="Summary" onclick="window.location.href='AccountServlet?method=summary'"/>
  </div>
  <!-- Button for displaying a summary with an 'onclick' event -->

  <div class="a">
    <input type="button" class="b" value="Expired Member List" onclick="window.location.href='AccountServlet?method=list_expire_member'"/>
  </div>
  <!-- Button for displaying the expired member list with an 'onclick' event -->

  <div style="font-size: 10px; position: absolute; bottom: 10px; right: 10px;">by SamLi.2022</div>
  <!-- Text with a specified font size and position -->

</div>
</body>
</html>
