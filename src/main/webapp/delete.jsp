<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The above line is a directive for setting the page language and character encoding -->

<!DOCTYPE html>
<!-- This line specifies the document type as HTML5 -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- The above line sets the character encoding for the HTML document -->

<title>Delete Account Information</title>
<!-- The title of the HTML page -->

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
<!-- Inline CSS styles for defining classes 'a', 'b', 'tb', and 'td' -->

</head>
<body style="background: #D2E9FF">
<!-- The body of the HTML document with a background color -->

<%
// Retrieve a message from the request, if it exists.
Object message = request.getAttribute("message");
if (message != null && !"".equals(message)) {
%>
    <script type="text/javascript">
        alert("<%=request.getAttribute("message")%>");
    </script>
<%
}
%>
<!-- Inline Java code to check and display a message if it exists -->

<div align="center">
    <h2 style="color: darkred;">Delete Account Information</h2>
    <!-- Heading with darkred color -->

    <table class="tb">
        <tr>
            <td>ID</td>
            <td>${account.id}</td>
        </tr>
        <!-- Table rows for displaying account information -->
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
    <!-- Table for displaying account details -->

    <div class="a">
        <a onclick="return check()" href="AccountServlet?method=delete&id=${account.id}">Delete</a>
    </div>
    <!-- Link to delete the account record with an 'onclick' event -->

    <br /><br />
    <a href="index.jsp">Back to Home</a>
    <!-- Link to go back to the home page -->

</div>
<script type="text/javascript">
    function check() {
        // JavaScript function to display a confirmation dialog for deleting a record.
        if (confirm("Are you sure you want to delete this record?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<!-- JavaScript function for confirming record deletion -->

</body>
</html>
