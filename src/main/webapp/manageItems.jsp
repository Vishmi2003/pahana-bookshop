<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Items - Pahana Edu Bookshop</title>
    <style>
        /* General Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; }

        html, body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FBE9E7; /* Light Beige */
            min-height: 100vh;
            color: #4E342E; /* Dark Brown */
        }

        header {
            background-color: #4E342E;
            color: #FFD54F; /* Gold Accent */
            padding: 20px;
            text-align: center;
        }

        header h1 { margin-bottom: 5px; }

        nav {
            margin-top: 10px;
        }

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
            margin: 30px auto;
            background-color: #6D4C41; /* Medium Brown */
            padding: 20px;
            border-radius: 10px;
            color: #FFD54F;
        }

        h2 { text-align: center; margin-bottom: 20px; }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #FBE9E7; /* Light Beige inside table */
            color: #4E342E;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #6D4C41;
        }

        th { background-color: #4E342E; color: #FFD54F; }

        tr:hover { background-color: #FFE0B2; }

        .action-btn {
            background-color: #4E342E;
            color: #FFD54F;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-right: 5px;
            transition: 0.3s;
        }

        .action-btn:hover { background-color: #6D4C41; }

        .back-btn {
            display: block;
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
    <h1>Manage Items</h1>
    <nav>
        <a href="adminDashboard.jsp">Admin Panel</a>
        <a href="help.jsp">Help</a>
        <a href="logout.jsp">Log Out</a>
    </nav>
</header>

<div class="container">
    <h2>Items List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Price (Rs.)</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/bookshop", "root", "password");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM items");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("book_name") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>
                <a class="action-btn" href="editItem.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a class="action-btn" href="deleteItem.jsp?id=<%= rs.getInt("id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error: "+e+"</td></tr>");
            }
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
