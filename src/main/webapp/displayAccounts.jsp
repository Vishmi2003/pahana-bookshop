<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Accounts - Pahana Edu Bookshop</title>
  <style>
    /* General Reset */
    * { margin: 0; padding: 0; box-sizing: border-box; }

    html, body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #FBE9E7; /* Light Beige */
      color: #4E342E; /* Dark Brown */
      min-height: 100vh;
    }

    header {
      background-color: #4E342E;
      color: #FFD54F; /* Gold Accent */
      padding: 20px;
      text-align: center;
    }

    header h1 { margin-bottom: 5px; }

    nav { margin-top: 10px; }
    nav a {
      color: #FFD54F;
      text-decoration: none;
      margin: 0 15px;
      font-weight: bold;
      transition: color 0.3s;
    }
    nav a:hover { color: #FBE9E7; }

    .container {
      width: 95%;
      max-width: 1000px;
      margin: 40px auto;
      background-color: #6D4C41; /* Medium Brown */
      padding: 25px;
      border-radius: 10px;
      color: #FFD54F; /* Gold Accent */
      overflow-x: auto;
    }

    h2 { text-align: center; margin-bottom: 20px; }

    table {
      width: 100%;
      border-collapse: collapse;
      text-align: left;
    }

    th, td {
      padding: 10px;
      border-bottom: 1px solid #FFD54F;
    }

    th {
      background-color: #4E342E;
      color: #FFD54F;
    }

    tr:hover {
      background-color: #5D4037;
      color: #FBE9E7;
    }

    .back-btn {
      text-align: center;
      margin-top: 20px;
    }

    .back-btn a {
      background-color: #4E342E;
      color: #FFD54F;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
      transition: 0.3s;
    }

    .back-btn a:hover { background-color: #6D4C41; }

    footer {
      background-color: #4E342E;
      color: #FFD54F;
      text-align: center;
      padding: 15px;
      margin-top: 30px;
    }
  </style>
</head>
<body>

<header>
  <h1>Customer Accounts</h1>
  <nav>
    <a href="adminDashboard.jsp">Admin Panel</a>
    <a href="help.jsp">Help</a>
    <a href="logout.jsp">Log Out</a>
  </nav>
</header>

<div class="container">
  <h2>Accounts List</h2>
  <table>
    <tr>
      <th>Account ID</th>
      <th>Customer ID</th>
      <th>Balance</th>
      <th>Last Transaction</th>
    </tr>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop", "root", "password");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM accounts");

        while(rs.next()){
    %>
    <tr>
      <td><%= rs.getInt("account_id") %></td>
      <td><%= rs.getInt("customer_id") %></td>
      <td>Rs. <%= rs.getDouble("balance") %></td>
      <td><%= rs.getString("last_transaction") %></td>
    </tr>
    <%
        }
        con.close();
      } catch(Exception e){ out.println("Error: " + e); }
    %>
  </table>

  <div class="back-btn">
    <a href="adminDashboard.jsp">&larr; Back to Admin Panel</a>
  </div>
</div>

<footer>
  <p>&copy; 2025 Pahana Edu Bookshop. All rights reserved.</p>
</footer>

</body>
</html>

