<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line sets the page language and character encoding -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing JSTL (JavaServer Pages Standard Tag Library) core taglib -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Setting the character encoding of the HTML page -->

    <title>Insert title here</title>
    <!-- The title of the HTML page -->

    <style>
        .a{
            margin-top: 20px;
        }
        <!-- Styling for elements with class 'a' -->
        .b{
            font-size: 20px;
            width: 160px;
            color: white;
            background-color: greenyellow;
        }
        <!-- Styling for elements with class 'b' -->
        .tb, td {
            font-size: 16px;
            padding:5px;
        }
        <!-- Styling for elements with class 'tb' and 'td' -->
    </style>
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
<!-- If 'message' is not empty, display an alert message using JavaScript -->
<%} %>

<div align="center">
    <!-- Center-aligning the content -->
    <h2 style="color: darkred;">Bill List</h2>
    <!-- Heading with specific style -->
    <table bordercolor="silver" border="1px" cellspacing="0px" style="border-collapse:collapse">
        <!-- Creating a table with specific attributes -->
        <tr bgcolor="#E8E8E8">
            <td>Record Number</td>
            <td>Name</td>
            <td>Amount</td>
            <td>Date</td>
            <td>Category</td>
            <td align="center" colspan="2">Action</td>
        </tr>
        <!-- Table header row with specific background color -->
        <c:forEach items="${accounts}" var="item">
        <!-- Loop through and display data returned from Servlet -->
            <tr bgcolor="white">
                <!-- Table row with white background -->
                <td>${item.id}</td>
                <!-- Displaying 'id' value from 'item' -->
                <td>${item.name}</td>
                <!-- Displaying 'name' value from 'item' -->
                <td>${item.amount}</td>
                <!-- Displaying 'amount' value from 'item' -->
                <td>${item.date}</td>
                <!-- Displaying 'date' value from 'item' -->
                <td>${item.type}</td>
                <!-- Displaying 'type' value from 'item' -->
                <td><a href="AccountServlet?method=getByid_For_Update&id=${item.id}">Edit</a></td>
                <!-- Creating an 'Edit' link with parameters to call the Servlet for updating -->
                <td><a href="AccountServlet?method=getByid_For_Delete&id=${item.id}">Delete</a></td>
                <!-- Creating a 'Delete' link with parameters to call the Servlet for deleting -->
            </tr>
        </c:forEach>
    </table>
    <!-- End of the table -->
    <br /><br />
    
        <input type="button"  value="Print" onclick="window.location.href='index.jsp'"/>
        <!-- Creating a 'Print' button that redirects to 'index.jsp' when clicked -->
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="index.jsp">Back to Home</a>
        <!-- Link to return to the home page -->
</div>
</body>
</html>
