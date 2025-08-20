<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books - Pahana Edu Bookshop</title>
    <style>
        /* Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #FBE9E7; /* Light beige */
            color: #4E342E; /* Dark brown */
            line-height: 1.6;
        }

        header {
            background-color: #4E342E; /* Dark Brown */
            color: #FFD54F; /* Gold */
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
        }
        .logo-title { display: flex; align-items: center; justify-content: center; gap: 15px; }
        #logo { width: 60px; height: auto; }
        h1 { font-size: 28px; }

        nav {
            margin-top: 10px;
        }
        nav a {
            color: #FFD54F;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        nav a:hover { color: #FBE9E7; }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #6D4C41; /* Medium brown */
            border-bottom: 2px solid #FFD54F;
            display: inline-block;
            padding-bottom: 5px;
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 20px;
        }

        .book-card {
            background-color: white;
            border: 1px solid #FFD54F;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .book-card:hover { transform: scale(1.02); }

        .book-card h3 {
            color: #4E342E;
            margin-bottom: 10px;
        }

        .book-card p { margin-bottom: 8px; }

        .price {
            font-weight: bold;
            color: #6D4C41;
        }

        .discount-price {
            font-weight: bold;
            color: #FFD54F; /* Highlight discount price */
            font-size: 18px;
        }

        footer {
            text-align: center;
            background-color: #6D4C41;
            color: white;
            padding: 15px;
            margin-top: 40px;
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
        <a href="help.jsp">Help</a>
    </nav>
</header>

<div class="container">
    <h2>Our Book Collection</h2>
    <div class="book-grid">

        <!-- Example Book -->
        <div class="book-card">
            <h3>The Silent River</h3>
            <p><strong>Author:</strong> Maya Sen</p>
            <p>A journey through love and resilience by the riverside.</p>
            <p class="price">Price: $20.00</p>
            <p class="discount-price">Discount Price (10% Off): $18.00</p>
        </div>

        <!-- Repeat for 30 Books -->
        <div class="book-card">
            <h3>Whispers of Dawn</h3>
            <p><strong>Author:</strong> Arjun Malhotra</p>
            <p>Poetic tales of hope and renewal as the sun rises.</p>
            <p class="price">Price: $18.00</p>
            <p class="discount-price">Discount Price (5% Off): $17.10</p>
        </div>

        <div class="book-card">
            <h3>Echoes of Eternity</h3>
            <p><strong>Author:</strong> Clara Fernandes</p>
            <p>A fantasy adventure across mystical realms.</p>
            <p class="price">Price: $25.00</p>
            <p class="discount-price">Discount Price (15% Off): $21.25</p>
        </div>

        <div class="book-card">
            <h3>Moonlight Sonata</h3>
            <p><strong>Author:</strong> Kenji Takahashi</p>
            <p>A touching romance set in Tokyo under the stars.</p>
            <p class="price">Price: $22.00</p>
            <p class="discount-price">Discount Price (10% Off): $19.80</p>
        </div>

        <div class="book-card">
            <h3>The Forgotten Kingdom</h3>
            <p><strong>Author:</strong> Diana Liu</p>
            <p>Unveiling mysteries of an ancient empire.</p>
            <p class="price">Price: $30.00</p>
            <p class="discount-price">Discount Price (15% Off): $25.50</p>
        </div>

        <!-- Add 25 more in the same style -->
        <%
            String[][] books = {
                    {"Winds of Fortune","Oliver Smith","Drama of ambition and destiny.","28.00","5"},
                    {"Crimson Horizon","Fatima Noor","Thriller chasing shadows of the sea.","24.00","10"},
                    {"The Glass Tower","Rohit Desai","Corporate greed and redemption.","26.00","15"},
                    {"Beneath the Banyan","Lakshmi Rao","Generations bound by tradition.","20.00","5"},
                    {"Starlight Dreams","Sofia Mendes","Children’s fantasy of galaxies.","18.00","10"},
                    {"The Last Nomad","Ali Khan","A desert tale of courage.","22.00","15"},
                    {"Ocean of Secrets","Emily Carter","A deep dive into mystery.","25.00","10"},
                    {"Sacred Flames","Javier Morales","Historical battles and glory.","27.00","15"},
                    {"Painted Skies","Aisha Patel","Romantic journey of colors.","19.00","5"},
                    {"Timeless Voyage","Marco Romano","Adventure across oceans.","21.00","10"},
                    {"Shadow Dancer","Nina Park","Mystery of hidden identities.","23.00","15"},
                    {"Harmony Road","Grace Wong","A touching story of music.","20.00","5"},
                    {"Ashes & Rain","Rajiv Mehta","Tragedy, love, and rebirth.","24.00","10"},
                    {"Velvet Nights","Sophia Cruz","Modern romance in Madrid.","26.00","15"},
                    {"Iron Empire","James O’Connor","Epic saga of a rising kingdom.","30.00","10"},
                    {"The Secret Heir","Amara Singh","Royal secrets revealed.","22.00","5"},
                    {"Golden Horizon","David Lee","Journey into new worlds.","28.00","15"},
                    {"Silent Echo","Priya Kapoor","Thriller with haunting echoes.","25.00","10"},
                    {"Garden of Stars","Isabella Rossi","Children’s magical garden.","18.00","5"},
                    {"Beyond the Storm","Ahmed Musa","Survival against all odds.","27.00","15"},
                    {"Frost & Flame","Yuki Sato","Fantasy clash of elements.","29.00","10"},
                    {"Scarlet Dust","Helena Petrova","Romantic tragedy in Russia.","24.00","5"},
                    {"Emerald Isles","Patrick O’Brien","Myth and magic of Ireland.","26.00","15"},
                    {"River of Fire","Chen Wei","Historical drama of dynasties.","28.00","10"},
                    {"The Lost Scroll","Samira Haddad","Ancient treasure hunt.","23.00","5"},
                    {"Waves of Silence","Leila Hassan","Emotional drama on the coast.","20.00","10"}
            };

            for (String[] b : books) {
                double price = Double.parseDouble(b[3]);
                int disc = Integer.parseInt(b[4]);
                double discPrice = price - (price * disc / 100.0);
        %>
        <div class="book-card">
            <h3><%= b[0] %></h3>
            <p><strong>Author:</strong> <%= b[1] %></p>
            <p><%= b[2] %></p>
            <p class="price">Price: $<%= String.format("%.2f", price) %></p>
            <p class="discount-price">Discount Price (<%= disc %>% Off): $<%= String.format("%.2f", discPrice) %></p>
        </div>
        <% } %>

    </div>
</div>

<footer>
    <p>&copy; 2025 Pahana Edu Bookshop. All Rights Reserved.</p>
</footer>

</body>
</html>
