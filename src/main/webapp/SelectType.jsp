<%@page import="dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Select Account Type</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            display: inline-block;
            margin-top: 50px;
            width: 400px;
        }
        h1 {
            color: #333;
        }
        input[type="radio"] {
            margin: 10px;
            transform: scale(1.2);
        }
        label {
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            margin: 10px 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-cancel {
            background-color: #dc3545;
        }
        .btn-cancel:hover {
            background-color: #a71d2a;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<%
Customer customer = (Customer) session.getAttribute("customer");
if (customer == null) {
    response.getWriter().print("<h1>Session Expired. Please Login.</h1>");
    request.getRequestDispatcher("login.html").include(request, response);
} else {
%>
<div class="container">
    <h1>Hello, <%= customer.getName() %></h1>
    <h1>Select Type of Account</h1>

    <form action="createbankaccount">
        <input type="radio" id="saving" name="banktype" value="saving" required>
        <label for="saving">Saving</label> <br>
        
        <input type="radio" id="current" name="banktype" value="current" required>
        <label for="current">Current</label> <br><br>

        <button type="reset" class="btn btn-cancel">Cancel</button>
        <button type="submit" class="btn">Submit</button>
    </form>
    <br>
    <a href="login.html"><button class="btn">Home</button></a>
</div>
<% } %>

</body>
</html>
