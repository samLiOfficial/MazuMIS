<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Donation Form</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            margin: 0 auto;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            margin-top: 0px;
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-size: 1.2em;
            margin-bottom: 5px;
            color: #666;
        }
        input[type="text"], select {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid black;
            margin-bottom: 5px;
            margin-right: 5px;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 15px;
            font-size: 1.2em;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #3e8e41;
        }
        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #333;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: #f00;
            font-size: 0.9em;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Donation Form</h2>
        <% Object message = request.getAttribute("message"); 
        if(message!=null && !"".equals(message)){ %>
            <div class="error"><%= message %></div>
        <% } %>
        <form action="AccountServlet?method=add" method="post" onsubmit="return check()"> <%-- Set up the form, 1. HTTP sending data method is POST --%>
            <label for="name">Name</label> <%-- text requirement --%>
            <input type="text" id="name" name="name" required> <%-- input field, set form id, and required --%>

            <label for="amount">Amount</label>
            <input type="text" id="amount" name="amount" required>

            <label for="date">Date</label>
            <input type="text" id="date" name="date" placeholder="yyyy-mm-dd" required>

            <label for="type">Donation Method</label>
            <select id="type" name="type"> <%--select field, set id (parameter) == type --%>
                <option value="Check">Check</option> <%-- options --%>
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Holy Light">Holy Light</option>
                <option value="Company Donation">Company Donation</option>
                <option value="Visitor Donation Box">Visitor Donation Box</option>
                <option value="Reoccuring Payment Every Month">Recurring Payment Every Month</option>
            </select>

            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" required>

            <button type="submit">Save</button> <%-- Set button type as submit button --%>
        </form>
        <a href="index.jsp">Back to Menu</a> <%-- have a link that returns to the main menu --%>
    </div>

    <script type="text/javascript">
        function check() {
            var name = document.getElementById("name");
            var amount = document.getElementById("amount");
            var date = document.getElementById("date");
            var phone = document.getElementById("phone");

            if (name.value.trim() == "") {
                alert("Please enter a name.");
                name.focus();
                return false;
            }
            if (amount.value.trim() == "") {
                alert("Please enter an amount.");
                amount.focus();
                return false;
            }
            if (date.value.trim() == "") {
                alert("Please enter a date in the format yyyy-mm-dd.");
                date.focus();
                return false;
            }
            if (phone.value.trim() == "") {
                alert("Please enter a phone number.");
                phone.focus();
                return false;
            }
        }
    </script>
</body>
</html>
                
