<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Banking Dashboard</title>
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
            width: 350px;
        }
        h1 {
            color: #333;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            margin: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            width: 100%;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Banking Dashboard</h1>
    
    <a href="Deposit.html"><button class="btn">Deposit</button></a>
    <a href="withdraw.html"><button class="btn">Withdraw</button></a>
    <a href="cheackbalance.jsp"><button class="btn">Check Balance</button></a>
    <a href="viewTransaction.jsp"><button class="btn">View Transaction</button></a>
    <a href="logout"><button class="btn">Logout</button></a>

</div>

</body>
</html>
