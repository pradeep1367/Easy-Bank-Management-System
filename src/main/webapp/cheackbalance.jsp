<%@page import="dto.Customer"%>
<%@page import="dao.BankDao"%>
<%@page import="dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Balance</title>
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
            margin-top: 160px;
            width: 400px;
        }
        h1 {
            color: #333;
        }
        .balance {
            font-size: 20px;
            font-weight: bold;
            color: green;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>

<%
    long acno = (long) request.getSession().getAttribute("acno");
    BankDao bankDao = new BankDao();
    BankAccount account = bankDao.find(acno);
    Customer customer = account.getCustomer();
%>

<div class="container">
    <h1>Hello, 
        <% if (customer.getGender().equalsIgnoreCase("male")) { %>Mr.<% } else { %>Ms.<% } %>
        <%= customer.getName() %>
    </h1>
    <h1>Your <%= account.getAccountType() %> account balance is:</h1>
    <p class="balance">₹<%= account.getAmount() %></p>
    
    <button class="btn"><a href="AccountHome.jsp">Back</a></button>
</div>

</body>
</html>
