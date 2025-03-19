<%@page import="dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            display: inline-block;
            margin-top: 50px;
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
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
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-logout {
            background-color: #dc3545;
            margin-top: 20px;
        }
        .btn-logout:hover {
            background-color: #a71d2a;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Admin Dashboard</h1>

    <% List<BankAccount> list = (List<BankAccount>) request.getAttribute("list"); %>

    <table>
        <tr>
            <th>Account Number</th>
            <th>Account Type</th>
            <th>Customer Name</th>
            <th>Customer ID</th>
            <th>Status</th>
            <th>Change Status</th>
        </tr>

        <% for (BankAccount account : list) { %>
        <tr>
            <td><%= account.getAccountNo() %></td>
            <td><%= account.getAccountType() %></td>
            <td><%= account.getCustomer().getName() %></td>
            <td><%= account.getCustomer().getCust_id() %></td>
            <td><%= account.isStatus() ? "Active" : "Inactive" %></td>
            <td>
                <a href="ChangeStatus?accountno=<%= account.getAccountNo() %>">
                    <button class="btn">Change Status</button>
                </a>
            </td>
        </tr>
        <% } %>

    </table>
    
    <br>
    <a href="home.html"><button class="btn btn-logout">Log Out</button></a>
</div>

</body>
</html>
