<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Account Information</title>
<style>
    .a {
        margin-top: 20px;
    }
    .b {
        font-size: 20px;
        width: 160px;
        color: white;
        background-color: greenyellow;
    }
    .tb, td {
        border: 1px solid black;
        font-size: 16px;
        background-color: white;
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
<%
}
%>
<div align="center">
    <h2 style="color: darkred;">Delete Account Information</h2>
    <table class="tb">
        <tr>
            <td>ID</td>
            <td>${account.id}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>${account.name}</td>
        </tr>
        <tr>
            <td>Amount</td>
            <td>${account.amount}</td>
        </tr>
        <tr>
            <td>Date</td>
            <td>${account.date}</td>
        </tr>
        <tr>
            <td>Type</td>
            <td>${account.type}</td>
        </tr>
    </table>
    <div class="a">
        <a onclick="return check()" href="AccountServlet?method=delete&id=${account.id}">Delete</a>
    </div>
    <br /><br />
    <a href="index.jsp">Back to Home</a>
</div>
<script type="text/javascript">
    function check() {
        if (confirm("Are you sure you want to delete this record?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>
