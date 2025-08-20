<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Pahana Edu Bookshop</title>
    <style>
        /* Reset */
        * { margin:0; padding:0; box-sizing:border-box; }

        html, body {
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #FBE9E7; /* Light beige background */
            color: #4E342E; /* Dark brown text */
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .content {
            flex: 1; /* Push footer to bottom */
        }

        /* Header */
        header {
            background-color: #4E342E; /* Dark Brown */
            color: #FFD54F; /* Gold accent */
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .logo-title { display: flex; align-items: center; justify-content: center; gap: 15px; }
        #logo { width: 60px; height: auto; }

        /* Navigation */
        nav {
            margin-top: 10px;
        }
        nav a {
            color: #FFD54F;
            text-decoration: none;
            margin: 0 12px;
            font-weight: bold;
            transition: all 0.3s;
        }
        nav a:hover { color: #FBE9E7; text-shadow: 0 0 5px #FFD54F; }

        /* Login Section */
        #login-section {
            background-color: #6D4C41; /* Medium brown */
            max-width: 400px;
            margin: 60px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            color: white;
        }

        #login-section h2 {
            text-align: center;
            color: #FFD54F; /* Gold accent */
            margin-bottom: 20px;
            border-bottom: 2px solid #FFD54F;
            padding-bottom: 5px;
        }

        form { display: flex; flex-direction: column; }

        label {
            font-weight: bold;
            margin: 10px 0 5px;
            color: #FFD54F; /* Gold accent labels */
        }

        input[type="text"], input[type="password"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #fff; /* White input fields */
            color: #4E342E; /* Dark text */
        }

        input[type="text"]:focus, input[type="password"]:focus { border-color: #FFD54F; outline:none; }

        input[type="submit"] {
            background-color: #FFD54F; /* Gold */
            color: #4E342E; /* Dark text */
            padding: 10px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover { background-color: #FFC107; }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #4E342E; /* Dark brown */
            background-color: #FFD54F;
            padding: 8px 12px;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
        }

        .back-btn:hover { background-color: #FFC107; text-decoration: none; }

        .success-msg { color: #FFD54F; text-align:center; margin-bottom:15px; }
        .error-msg { color: #FF8A65; text-align:center; margin-bottom:15px; }

        /* Footer */
        footer {
            text-align: center;
            background-color: #6D4C41; /* Medium brown */
            color: white;
            padding: 15px 10px;
            margin-top: 40px;
        }

        /* Responsive */
        @media (max-width: 500px) {
            #login-section { margin: 30px 16px; padding: 20px; }
            nav a { display: block; margin: 6px 0; }
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
        <a href="Register.jsp">Register</a>
        <a href="help.jsp">Help</a>
    </nav>
</header>

<div class="content">
    <section id="login-section">
        <h2>Customer Login</h2>

        <%
            String msg = request.getParameter("msg");
            if ("success".equals(msg)) { %>
        <p class="success-msg">Registration successful! Please log in.</p>
        <% } else if ("fail".equals(msg)) { %>
        <p class="error-msg">Registration failed. Please try again.</p>
        <% } else if ("error".equals(msg)) { %>
        <p class="error-msg">An error occurred. Please try again later.</p>
        <% } %>

        <form action="LoginServlet" method="post">
            <label for="username">Username (Email or Account No):</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
            <a href="index.jsp" class="back-btn">⬅ Back to Home</a>
        </form>
    </section>
</div>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All Rights Reserved.</p>
</footer>

</body>
</html>
