<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help - Pahana Edu Bookshop</title>
    <style>
        /* General Reset */
        * { margin:0; padding:0; box-sizing:border-box; }

        html, body {
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #FBE9E7; /* Light Beige */
            color: #4E342E; /* Dark Brown */
            display: flex;
            flex-direction: column;
        }

        .content { flex: 1; }

        /* Header */
        header {
            background-color: #4E342E; /* Dark Brown */
            color: #FFD54F; /* Gold Accent */
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .logo-title { display: flex; align-items: center; justify-content: center; gap: 15px; }
        #logo { width: 60px; height: auto; }

        /* Navigation Bar */
        nav { margin-top: 10px; }
        nav a {
            color: #FFD54F; /* Gold Accent */
            text-decoration: none;
            margin: 0 12px;
            font-weight: bold;
        }
        nav a:hover { text-decoration: underline; }

        /* Main Content Container */
        .container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: #6D4C41; /* Medium Brown */
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            color: #FBE9E7;
        }

        /* Headings */
        h2 {
            color: #FFD54F; /* Gold Accent */
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #FFD54F;
            padding-bottom: 10px;
        }
        h3 { color: #FFD54F; margin-top: 20px; margin-bottom: 10px; }

        /* Lists */
        ul { line-height: 1.8; margin-left: 20px; }
        ul li { padding: 6px 0; border-bottom: 1px solid #FBE9E7; }
        ul li:last-child { border-bottom: none; }

        /* Links */
        a { color: #FFD54F; text-decoration: none; }
        a:hover { text-decoration: underline; }

        /* Back Button */
        .back-button { margin-top: 30px; text-align: center; }
        .back-button a {
            display: inline-block;
            background-color: #FFD54F; /* Gold Accent */
            color: #4E342E; /* Dark Brown */
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .back-button a:hover { background-color: #FFC107; }

        /* Footer */
        footer {
            text-align: center;
            background-color: #6D4C41; /* Medium Brown */
            color: white;
            padding: 15px 0;
            margin-top: 40px;
        }

        /* Responsive */
        @media (max-width: 500px) {
            .container { margin: 30px 16px; padding: 20px; }
        }
    </style>
</head>
<body>

<header>
    <div class="logo-title">
        <img src="https://cdn-icons-png.flaticon.com/512/29/29302.png" id="logo" alt="Bookshop Logo">
        <h1>Pahana Edu Bookshop</h1>
    </div>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="books.jsp">Books</a>
        <a href="offers.jsp">Offers</a>
        <a href="login.jsp">Login</a>
        <a href="Register.jsp">Register</a>
    </nav>
</header>

<div class="content">
    <section class="container">
        <h2>Help & User Guidelines</h2>
        <p>Welcome to <strong>Pahana Edu Bookshop</strong>! Follow these instructions to use the system effectively.</p>

        <h3>1. Logging In</h3>
        <ul>
            <li>Use your registered email and password to log in.</li>
            <li>If you do not have an account, contact the administrator to create one.</li>
            <li>Select the correct portal: <em>Admin</em>, <em>Staff</em>, or <em>Customer</em>.</li>
        </ul>

        <h3>2. Dashboard Navigation</h3>
        <ul>
            <li><strong>Admin:</strong> Manage users, inventory, and view reports.</li>
            <li><strong>Staff:</strong> Process orders, manage customer requests, update inventory.</li>
            <li><strong>Customer:</strong> Browse books, place orders, view order history.</li>
        </ul>

        <h3>3. Placing an Order</h3>
        <ul>
            <li>Browse available books in the catalog.</li>
            <li>Add desired books to your cart.</li>
            <li>Proceed to checkout and confirm your order.</li>
        </ul>

        <h3>4. Managing Your Account</h3>
        <ul>
            <li>Update personal information in account settings.</li>
            <li>Change your password regularly.</li>
            <li>Log out after each session to protect your account.</li>
        </ul>

        <h3>5. Getting Further Assistance</h3>
        <ul>
            <li>Contact support at <a href="mailto:support@pahanaedu.lk">support@pahanaedu.lk</a>.</li>
            <li>For technical help, reach out to the system administrator.</li>
        </ul>

        <div class="back-button">
            <a href="index.jsp">&larr; Back to Home</a>
        </div>
    </section>
</div>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All rights reserved.</p>
</footer>

</body>
</html>
