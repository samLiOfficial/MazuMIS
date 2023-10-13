<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Summary Page</title>
    <style>
        body {
            background-color: #D2E9FF;
            font-family: Arial, Helvetica, sans-serif;
        }
        h2 {
            color: darkred;
        }
        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 50%;
            text-align: center;
        }
        th {
            background-color: white;
            color: black;
            padding: 10px;
        }
        td {
            padding: 8px;
        }
        input[type=button] {
            background-color: white;
            color: black;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }
        a {
            color: blue;
            text-decoration: none;
            font-size: 16px;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div align="center">
        <h2>Summary</h2>
        <table border="1" cellspacing="0">
            <tr>
                <th>Total Donors</th>
                <th>Total Donations ($)</th>
            </tr>
            <tr>
                <td>${statistic.amount_Donor}</td>
                <td>${statistic.amount_Money}</td>
            </tr>
        </table>
        <br />
        <input type="button" value="Print" onclick="window.print();" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
