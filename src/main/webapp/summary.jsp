<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- The above line sets the page language and character encoding -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing JSTL core taglib for use in JSP -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Setting the character encoding of the HTML page -->

    <title>Summary Page</title>
    <!-- The title of the HTML page -->

    <style>
        body {
            background-color: #D2E9FF;
            font-family: Arial, Helvetica, sans-serif;
        }
        <!-- Styling for the body of the page -->
        h2 {
            color: darkred;
        }
        <!-- Styling for heading 2 -->
        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 50%;
            text-align: center;
        }
        <!-- Styling for tables -->
        th {
            background-color: white;
            color: black;
            padding: 10px;
        }
        <!-- Styling for table headers -->
        td {
            padding: 8px;
        }
        <!-- Styling for table cells -->
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
        <!-- Styling for input buttons -->
        a {
            color: blue;
            text-decoration: none;
            font-size: 16px;
            margin-left: 20px;
        }
        <!-- Styling for anchor links -->
    </style>
</head>
<body>
    <!-- The body of the HTML document -->

    <div align="center">
        <!-- Center-aligning the content -->
        <h2>Summary</h2>
        <!-- Heading with specific style -->
        <table border="1" cellspacing="0">
            <!-- Table with border and cell spacing -->
            <tr>
                <th>Total Donors</th>
                <!-- Table header cell for Total Donors -->
                <th>Total Donations ($)</th>
                <!-- Table header cell for Total Donations -->
            </tr>
            <tr>
                <td>${statistic.amount_Donor}</td>
                <!-- Displaying the Total Donors from JSP variable 'statistic.amount_Donor' -->
                <td>${statistic.amount_Money}</td>
                <!-- Displaying the Total Donations from JSP variable 'statistic.amount_Money' -->
            </tr>
        </table>
        <!-- End of the table -->
        <br />
        <input type="button" value="Print" onclick="window.print();" />
        <!-- Button to trigger printing the page -->
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!-- Adding spaces for formatting -->
        <a href="index.jsp">Back to Home</a>
        <!-- Link to return to the home page -->
    </div>
</body>
</html>
