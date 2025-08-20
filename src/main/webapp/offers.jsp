<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Special Offers - Pahana Edu Bookshop</title>
    <style>
        /* Reset */
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
            color: #FFD54F; /* Gold */
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .logo-title { display: flex; align-items: center; justify-content: center; gap: 15px; }
        #logo { width: 60px; height: auto; }

        nav { margin-top: 10px; }
        nav a {
            color: #FFD54F;
            text-decoration: none;
            margin: 0 12px;
            font-weight: bold;
        }
        nav a.active, nav a:hover { text-decoration: underline; }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: #6D4C41; /* Medium Brown */
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            color: #FBE9E7;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #FFD54F; /* Gold */
            padding-bottom: 10px;
            color: #FFD54F;
        }

        h3 { margin: 10px 0; color: #FFD54F; }

        /* Offers Grid */
        .offers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .offer-card {
            background-color: #4E342E; /* Dark Brown */
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }

        .offer-card:hover { transform: translateY(-5px); }

        .offer-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        /* Back Button */
        .back-button {
            margin-top: 30px;
            text-align: center;
        }

        .back-button a {
            display: inline-block;
            background-color: #FFD54F; /* Gold */
            color: #4E342E; /* Dark Brown */
            padding: 10px 20px;
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
            .offers-grid { grid-template-columns: 1fr; }
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
        <a href="offers.jsp" class="active">Offers</a>
        <a href="login.jsp">Login</a>
        <a href="Register.jsp">Register</a>
        <a href="help.jsp">Help</a>
    </nav>
</header>

<div class="content">
    <section class="container">
        <h2>Special Offers on Books</h2>
        <p style="text-align:center; margin-bottom:25px;">Check out our latest deals and discounts on educational books!</p>

        <div class="offers-grid">
            <div class="offer-card">
                <img src="https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=400&q=80" alt="Book 1">
                <h3>Learn Java Programming</h3>
                <p>Special offer: Buy 1, get 1 free!</p>
            </div>

            <div class="offer-card">
                <img src="https://images.unsplash.com/photo-1544717305-996b815c338c?auto=format&fit=crop&w=400&q=80" alt="Book 2">
                <h3>Mathematics Made Easy</h3>
                <p>15% discount for students.</p>
            </div>

            <div class="offer-card">
                <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=400&q=80" alt="Book 3">
                <h3>Science Experiments</h3>
                <p>Buy 2 get 1 free on school textbooks.</p>
            </div>

            <div class="offer-card">
                <img src="https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=400&q=80" alt="Book 4">
                <h3>History of World</h3>
                <p>Special student discount available.</p>
            </div>

            <div class="offer-card">
                <img src="https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=400&q=80" alt="Book 5">
                <h3>English Literature</h3>
                <p>Free bookmark for purchases over Rs. 1000.</p>
            </div>

            <div class="offer-card">
                <img src="https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&w=400&q=80" alt="Book 6">
                <h3>Art & Design</h3>
                <p>Special holiday discount.</p>
            </div>
        </div>

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
