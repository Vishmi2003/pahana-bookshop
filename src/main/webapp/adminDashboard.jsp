<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Pahana Edu Bookshop</title>
    <style>
        /* Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; }

        html, body {
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: #4E342E;
            background: linear-gradient(135deg, #FBE9E7 0%, #FFF3E0 100%),
            url('https://www.transparenttextures.com/patterns/paper-fibers.png');
            background-size: cover;
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
            overflow: hidden;
        }

        header::after {
            content: "";
            position: absolute;
            top: 0; left: -50%;
            width: 200%;
            height: 100%;
            background: rgba(255,255,255,0.05);
            transform: skewX(-30deg);
            animation: shimmer 6s infinite linear;
        }

        @keyframes shimmer {
            0% { left: -50%; }
            100% { left: 100%; }
        }

        .logo-title {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }

        #logo { width: 55px; }

        header h1 {
            font-size: 2.2rem;
            letter-spacing: 1px;
        }

        /* Navigation Bar */
        nav { margin-top: 12px; }
        nav a {
            color: #FFD54F;
            text-decoration: none;
            margin: 0 18px;
            font-weight: bold;
            font-size: 1.05rem;
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

        /* Card Style */
        .admin-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
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

        .admin-card img { width: 70px; margin-bottom: 12px; }
        .admin-card h3 { color: #4E342E; font-size: 1.2rem; }

        .admin-card:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        }

        /* Back Home Button */
        .back-home {
            text-align: center;
            margin: 30px 0;
        }
        .back-home a {
            background: linear-gradient(90deg, #4E342E, #6D4C41);
            color: #FFD54F;
            padding: 14px 28px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        .back-home a:hover {
            background: linear-gradient(90deg, #FFD54F, #ffca28);
            color: #4E342E;
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
            .admin-card { max-width: 100%; }
        }
    </style>
</head>
<body>

<header>
    <div class="logo-title">
        <img src="https://cdn-icons-png.flaticon.com/512/29/29302.png" id="logo" alt="Bookshop Logo">
        <h1>Admin Panel</h1>
    </div>
    <nav>
        <a href="index.jsp">Home</a>XS
        <a href="help.jsp">Help</a>
        <a href="logout.jsp">Log Out</a>
    </nav>
</header>

<div class="content">
    <section class="container">
        <div class="admin-card" onclick="window.location.href='manageStaff.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Staff Icon">
            <h3>Manage Staff</h3>
        </div>
        <div class="admin-card" onclick="window.location.href='manageItems.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/2232/2232688.png" alt="Items Icon">
            <h3>Manage Items</h3>
        </div>
        <div class="admin-card" onclick="window.location.href='editCustomer.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/1077/1077012.png" alt="Customer Icon">
            <h3>Edit Customer Info</h3>
        </div>
        <div class="admin-card" onclick="window.location.href='displayAccounts.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135810.png" alt="Accounts Icon">
            <h3>Display Customer Accounts</h3>
        </div>
        <div class="admin-card" onclick="window.location.href='billing.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/2910/2910762.png" alt="Billing Icon">
            <h3>Calculate & Print Bill</h3>
        </div>
        <div class="admin-card" onclick="window.location.href='books.jsp'">
            <img src="https://cdn-icons-png.flaticon.com/512/2910/2910790.png" alt="Book Management Icon">
            <h3>Manage Books & Prices</h3>
        </div>
    </section>

    <div class="back-home">
        <a href="index.jsp">⬅ Back to Home</a>
    </div>
</div>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All rights reserved.</p>
</footer>

</body>
</html>
