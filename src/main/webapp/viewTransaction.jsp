<%@page import="dto.Customer"%>
<%@page import="dto.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="dto.BankAccount"%>
<%@page import="dao.BankDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Transactions</title>
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
            width: 80%;
        }
        h1, h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
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
        }
    </style>
</head>
<body>

<%
Customer customer = (Customer) request.getSession().getAttribute("customer");
if (customer == null) {
    response.getWriter().print("<h1>Session Expired! Please Login Again</h1>");
    request.getRequestDispatcher("login.html").include(request, response);
} else {
    long acno = (long) request.getSession().getAttribute("acno");
    BankDao bankDao = new BankDao();
    BankAccount account = bankDao.find(acno);
    List<Transaction> transactions = account.getTransactions();
%>

<div class="container">
    <h1>Account Details</h1>
    <h2>Account Number: <%= account.getAccountNo() %></h2>
    <h2>Account Type: <%= account.getAccountType() %></h2>

    <h1>Transaction History</h1>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Deposit</th>
            <th>Withdraw</th>
            <th>Balance</th>
            <th>Date/Time</th>
        </tr>

        <% for (Transaction transaction : transactions) { %>
        <tr>
            <td><%= transaction.getId() %></td>
            <td><%= transaction.getDeposit() > 0 ? transaction.getDeposit() : "-" %></td>
            <td><%= transaction.getWithdraw() > 0 ? transaction.getWithdraw() : "-" %></td>
            <td><%= transaction.getBalance() %></td>
            <td><%= transaction.getDateTime() %></td>
        </tr>
        <% } %>
    </table>

    <a href="AccountHome.jsp"><button class="btn">Back</button></a>
</div>

<% } %>

</body>
</html>
