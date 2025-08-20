<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Pahana Edu Bookshop</title>
    <style>
        /* Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: #4E342E;
            background: linear-gradient(135deg, #FBE9E7 0%, #FFF3E0 100%);
        }

        .content { flex: 1; }

        /* Header */
        header {
            background: linear-gradient(90deg, #6D4C41, #4E342E);
            color: #FFD54F;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.25);
            position: relative;
        }

        .logo-title {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }

        #logo { width: 55px; }

        header h1 {
            font-size: 2rem;
            letter-spacing: 1px;
        }

        /* Navigation */
        nav { margin-top: 12px; }
        nav a {
            color: #FFD54F;
            text-decoration: none;
            margin: 0 18px;
            font-weight: bold;
            font-size: 1rem;
            transition: all 0.3s ease;
            position: relative;
        }
        nav a::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -4px;
            left: 0;
            background-color: #FFD54F;
            transition: width 0.3s ease;
        }
        nav a:hover::after { width: 100%; }
        nav a:hover { color: #fff8e1; }

        /* Container */
        .container {
            width: 90%;
            max-width: 1100px;
            margin: 50px auto;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        /* User Card */
        .user-card {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            cursor: pointer;
            flex: 1 1 240px;
            max-width: 250px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            border: 1px solid rgba(255,255,255,0.3);
        }

        .user-card img { width: 70px; margin-bottom: 12px; }
        .user-card h3 { color: #4E342E; font-size: 1.2rem; }

        .user-card:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        }

        /* Footer */
        footer {
            background: #6D4C41;
            color: white;
            text-align: center;
            padding: 18px;
            margin-top: auto;
            font-size: 0.95rem;
        }

        /* Responsive */
        @media(max-width: 600px) {
            nav a { margin: 0 10px; font-size: 0.95rem; }
            .container { gap: 18px; }
            .user-card { max-width: 100%; }
        }
    </style>
</head>
<body>

<header>
    <div class="logo-title">
        <img src="https://cdn-icons-png.flaticon.com/512/29/29302.png" id="logo" alt="Bookshop Logo">
        <h1>User Dashboard</h1>
    </div>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="help.jsp">Help</a>
        <a href="logout.jsp">Log Out</a>
    </nav>
</header>

<div class="content">
    <section class="container">
        <div class="user-card" onclick="window.location.href='viewBooks.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/29/29302.png" alt="Books Icon">
            <h3>Browse Books</h3>
        </div>
        <div class="user-card" onclick="window.location.href='myAccount.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/1077/1077012.png" alt="Account Icon">
            <h3>My Account</h3>
        </div>
        <div class="user-card" onclick="window.location.href='myOrders.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/2910/2910762.png" alt="Orders Icon">
            <h3>My Orders</h3>
        </div>
        <div class="user-card" onclick="window.location.href='billingHistory.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135810.png" alt="Billing Icon">
            <h3>Billing History</h3>
        </div>
        <div class="user-card" onclick="window.location.href='help.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png" alt="Help Icon">
            <h3>Get Help</h3>
        </div>
    </section>
</div>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All rights reserved.</p>
</footer>

</body>
</html>
