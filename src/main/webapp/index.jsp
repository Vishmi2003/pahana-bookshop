<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu Bookshop</title>
    <style>
        /* Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #FBE9E7;
            color: #4E342E;
        }

        /* Header */
        header {
            background: linear-gradient(to right, #4E342E, #6D4C41);
            color: #FFD54F;
            padding: 15px 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .logo-title {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        #logo {
            width: 55px;
            height: 55px;
            border-radius: 5px;
        }

        header h1 {
            font-size: 1.8rem;
            letter-spacing: 1px;
        }

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

        /* Hero Section */
        .hero {
            background: url('https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
            height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #FBE9E7;
            text-shadow: 2px 2px 5px #4E342E;
            text-align: center;
        }

        .hero h2 {
            font-size: 2.2rem;
            margin-bottom: 15px;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 600px;
        }

        /* Featured Books */
        .section {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .section h2 {
            text-align: center;
            color: #4E342E;
            margin-bottom: 25px;
            border-bottom: 2px solid #6D4C41;
            display: inline-block;
            padding-bottom: 5px;
        }

        .books-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .book-card {
            background-color: #6D4C41;
            border-radius: 10px;
            padding: 10px;
            color: #FFD54F;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        .book-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .book-card h3 {
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .book-card p {
            font-size: 0.9rem;
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        /* Offers Section */
        .offers {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }

        .offer-card {
            background-color: #4E342E;
            color: #FFD54F;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            width: 250px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .offer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        footer {
            background-color: #4E342E;
            color: #FFD54F;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }

        /* Responsive */
        @media(max-width: 768px) {
            .hero h2 { font-size: 1.8rem; }
            .hero p { font-size: 1rem; }
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
        <a href="help.jsp">Help</a>
    </nav>
</header>

<section class="hero">
    <h2>Discover Your Next Great Read!</h2>
    <p>Welcome to Pahana Edu Bookshop – your cozy corner for educational and classic books. Explore, enjoy, and learn.</p>
</section>

<section class="section">
    <h2>Featured Books</h2>
    <div class="books-grid">
        <div class="book-card">
            <img src="https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=400&q=80" alt="Book 1">
            <h3>Mathematics Basics</h3>
            <p>Author: John Doe</p>
        </div>
        <div class="book-card">
            <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=400&q=80" alt="Book 2">
            <h3>Science Explorer</h3>
            <p>Author: Jane Smith</p>
        </div>
        <div class="book-card">
            <img src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&w=400&q=80" alt="Book 3">
            <h3>History of Art</h3>
            <p>Author: Alex Brown</p>
        </div>
    </div>
</section>

<section class="section">
    <h2>Special Offers</h2>
    <div class="offers">
        <div class="offer-card">
            <h3>Buy 2 Get 1 Free</h3>
            <p>Applicable on school textbooks</p>
        </div>
        <div class="offer-card">
            <h3>15% Discount</h3>
            <p>For university students</p>
        </div>
        <div class="offer-card">
            <h3>Free Bookmarks</h3>
            <p>On purchases above Rs. 1000</p>
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All rights reserved.</p>
</footer>

</body>
</html>
