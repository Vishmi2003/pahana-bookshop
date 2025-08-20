<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Management - Pahana Edu Bookshop</title>
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
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
            background-color: #6D4C41; /* Medium Brown */
            padding: 25px;
            border-radius: 10px;
            color: #FFD54F; /* Gold Accent */
        }

        h2 { text-align: center; margin-bottom: 20px; }

        form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            flex: 1 0 100%;
        }

        input[type="text"], input[type="number"] {
            padding: 8px;
            border-radius: 5px;
            border: none;
            flex: 1 1 200px;
        }

        .btn {
            background-color: #4E342E;
            color: #FFD54F;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover { background-color: #6D4C41; }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #FFD54F;
            text-align: left;
        }

        th { background-color: #4E342E; }

        tr:hover { background-color: #5D4037; color: #FBE9E7; }

        .actions a {
            margin-right: 10px;
            color: #FFD54F;
            text-decoration: none;
            font-weight: bold;
        }

        .actions a:hover { text-decoration: underline; }

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
    <h1>Book Management</h1>
    <nav>
        <a href="adminDashboard.jsp">Admin Panel</a>
        <a href="help.jsp">Help</a>
        <a href="logout.jsp">Log Out</a>
    </nav>
</header>

<div class="container">
    <h2>Add New Book</h2>
    <form action="addBook.jsp" method="post">
        <label for="title">Book Title:</label>
        <input type="text" name="title" id="title" required>

        <label for="author">Author:</label>
        <input type="text" name="author" id="author" required>

        <label for="price">Price (Rs.):</label>
        <input type="number" name="price" id="price" step="0.01" required>

        <label for="stock">Stock:</label>
        <input type="number" name="stock" id="stock" required>

        <button type="submit" class="btn">Add Book</button>
    </form>

    <h2>Existing Books</h2>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price (Rs.)</th>
            <th>Stock</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshop","root","password");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM books");

                while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td class="actions">
                <a href="editBook.jsp?book_id=<%= rs.getInt("book_id") %>">Edit</a> |
                <a href="deleteBook.jsp?book_id=<%= rs.getInt("book_id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) { out.println(e); }
        %>
        </tbody>
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

