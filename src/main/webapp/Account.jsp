<%@page import="dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Account</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        text-align: center;
    }
    h1 {
        color: #333;
    }
    .container {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        display: inline-block;
        margin-top: 180px;
    }
    button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }
    button:hover {
        background-color: #0056b3;
    }
    a {
        text-decoration: none;
    }
</style>
</head>
<body>

<div class="container">
    <%
        List<BankAccount> list = (List<BankAccount>) request.getAttribute("list");
        if (list == null || list.isEmpty()) {
    %>
        <h1>No Active Account Found</h1>
    <%
        } else {
    %>
        <h1>Select Bank Account</h1>
        <%
            for (BankAccount account : list) {
        %>
            <a href="Setaccount?acno=<%= account.getAccountNo() %>">
                <button><%= account.getAccountNo() %></button>
            </a>
            <br>
        <%
            }
        }
    %>
    <br>
    <a href="Customerhome.html"><button>Back</button></a>
</div>

</body>
</html>
