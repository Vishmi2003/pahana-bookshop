<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = "", email = "", phone = "", username = "", password = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop", "root", "password");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM customers WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            name = rs.getString("full_name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            username = rs.getString("username");
            password = rs.getString("password");
        }
        con.close();
    } catch(Exception e) { out.println("Error: "+e); }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Customer - Pahana Edu Bookshop</title>
    <style>
        /* General Reset */
        * { margin:0; padding:0; box-sizing: border-box; }

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
            width: 90%;
            max-width: 600px;
            margin: 40px auto;
            background-color: #6D4C41; /* Medium Brown */
            padding: 25px;
            border-radius: 10px;
            color: #FFD54F;
        }

        h2 { text-align: center; margin-bottom: 20px; }

        form { display: flex; flex-direction: column; gap: 15px; }

        label { font-weight: bold; }
        input[type="text"], input[type="email"], input[type="password"] {
            padding: 8px;
            border-radius: 5px;
            border: none;
        }

        input[type="submit"] {
            background-color: #4E342E;
            color: #FFD54F;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover { background-color: #6D4C41; }

        .back-btn {
            text-align: center;
            margin-top: 15px;
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
    <h1>Edit Customer Info</h1>
    <nav>
        <a href="adminDashboard.jsp">Admin Panel</a>
        <a href="help.jsp">Help</a>
        <a href="logout.jsp">Log Out</a>
    </nav>
</header>

<div class="container">
    <h2>Edit Customer</h2>
    <form action="updateCustomer.jsp" method="post">
        <input type="hidden" name="id" value="<%=id%>">

        <label for="name">Full Name:</label>
        <input type="text" id="name" name="full_name" value="<%=name%>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%=email%>" required>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<%=phone%>" required>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%=username%>" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="<%=password%>" required>

        <input type="submit" value="Update Customer">
    </form>

    <div class="back-btn">
        <a href="adminDashboard.jsp">&larr; Back to Admin Panel</a>
    </div>
</div>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All rights reserved.</p>
</footer>

</body>
</html>
