<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line sets the page language and character encoding -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Setting the character encoding of the HTML page -->

    <title>Insert title here</title>
    <!-- The title of the HTML page -->

    <style>
        .a{
            margin-top: 20px;
        }
        <!-- Styling for elements with class 'a' -->
        .b{
            color: black;
        }
        <!-- Styling for elements with class 'b' -->
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
    <h2 style="color: darkred;">Edit Information</h2>
    <!-- Heading with specific style -->
    <form action="AccountServlet?method=update" method="post" onsubmit="return check()">
    <!-- Form that submits data to 'AccountServlet' with the 'update' method on submission and checks using the 'check()' function -->

        <div class="a">
            ID<input type="text"  id="id" name="id" value="${account.id}" readonly/>
            <!-- Input field for 'ID' with value from 'account.id' (readonly) -->
        </div>
        <div class="a">
            Name<input type="text"  id="name" name="name" value="${account.name}"/>
            <!-- Input field for 'Name' with value from 'account.name' -->
        </div>
        <div class="a">
            Amount<input type="text" id="amount" name="amount" value="${account.amount}"/>
            <!-- Input field for 'Amount' with value from 'account.amount' -->
        </div>
        <div class="a">
            Date<input type="text" id="date" name="date" value="${account.date}"/>
            <!-- Input field for 'Date' with value from 'account.date' -->
        </div>
        <div class="a">
            Type<input type="text"  name="type" value="${account.type}"/>
            <!-- Input field for 'Type' with value from 'account.type' -->
        </div>
        <div class="a">
            Phone<input type="text"  name="phone" value="${account.phone}"/>
            <!-- Input field for 'Phone' with value from 'account.phone' -->
        </div>
        <div class="a">
            <button type="submit" class="b">Edit</button>
            <!-- Submit button with class 'b' -->
        </div>
    </form>
    <!-- End of the form -->
    <br /><br />
    <a href="index.jsp">Back to Homepage</a>
    <!-- Link to return to the home page -->
</div>
<script type="text/javascript">
    function check() {
        var b = document.getElementById("amount");
        var c = document.getElementById("date");
        <!-- Getting elements by their IDs -->

        <%-- Check if some data fields are empty --%>
        if(b.value == '') {
            alert('Amount is empty');
            b.focus();
            return false;
        }
        <!-- Check if 'Amount' field is empty and show an alert -->
        if(c.value == '') {
            alert('Date is empty');
            c.focus();
            return false;
        }
        <!-- Check if 'Date' field is empty and show an alert -->
    }
</script>
</body>
</html>
