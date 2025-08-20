<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Pahana Edu Bookshop</title>
    <meta charset="UTF-8">
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://www.transparenttextures.com/patterns/old-wall.png'), #FBE9E7;
            color:#4E342E; line-height:1.6;
        }
        header { background:linear-gradient(to right,#4E342E,#6D4C41); color:#fff; padding:15px 20px; text-align:center; box-shadow:0 4px 6px rgba(0,0,0,.2); }
        nav a { color:#FFD54F; text-decoration:none; margin:0 14px; font-weight:bold; }
        nav a:hover { color:#fff; text-shadow:0 0 5px #FFD54F; }
        .register-container {
            max-width:520px; background:rgba(78,52,46,.95); margin:40px auto; padding:28px 24px;
            border-radius:12px; color:#fff; position:relative; box-shadow:0 3px 8px rgba(0,0,0,.2);
        }
        .register-container::before {
            content:""; position:absolute; inset:0; background:url('https://cdn-icons-png.flaticon.com/512/29/29302.png') no-repeat center/150px 150px;
            opacity:.06; z-index:0;
        }
        .register-container h2 { color:#FFD54F; margin-bottom:18px; text-align:center; border-bottom:2px solid #FFD54F; padding-bottom:6px; position:relative; z-index:1; }
        label { display:block; margin:8px 0 6px; font-weight:600; color:#FFD54F; position:relative; z-index:1; }
        input, select {
            width:100%; padding:10px; margin-bottom:14px; border:1px solid #ccc; border-radius:8px; font-size:14px; color:#4E342E; position:relative; z-index:1;
        }
        input:focus, select:focus { border-color:#FFD54F; outline:none; }
        input[type="submit"] { background:#FFD54F; color:#4E342E; font-weight:700; cursor:pointer; transition:.25s; }
        input[type="submit"]:hover { background:#FFCA28; }
        footer { text-align:center; background:#6D4C41; color:#fff; padding:12px; margin-top:20px; font-size:.95rem; }
        .hint { font-size:.85rem; opacity:.9; margin-top:-8px; margin-bottom:12px; }
    </style>
    <script>
        function validateForm() {
            const pass = document.getElementById('password').value.trim();
            const confirm = document.getElementById('confirmPassword').value.trim();

            if (pass.length < 6) {
                alert("Password must be at least 6 characters.");
                return false;
            }
            if (pass !== confirm) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<header>
    <h1>Pahana Edu Bookshop</h1>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </nav>
</header>

<div class="register-container">
    <h2>Register</h2>

    <!-- IMPORTANT: the 'name' values below must match what the servlet reads -->
    <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
        <!-- If your ID column is AUTO_INCREMENT you can leave this blank to auto-generate -->
        <label for="id">ID (optional if auto)</label>
        <input type="number" name="id" id="id" placeholder="Leave empty to auto-generate">

        <label for="account_no">Account Number</label>
        <input type="number" name="account_no" id="account_no" required>

        <label for="name">Full Name</label>
        <input type="text" name="name" id="name" required>

        <label for="address">Address</label>
        <input type="text" name="address" id="address">

        <label for="contact_number">Contact Number</label>
        <input type="tel" name="contact_number" id="contact_number" pattern="[0-9+\-\s]{7,15}" class="mb-1">
        <div class="hint">e.g. 0771234567</div>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" minlength="6" required>

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" name="confirmPassword" id="confirmPassword" minlength="6" required>

        <label for="role">Role</label>
        <select name="role" id="role" required>
            <option value="user">User</option>
            <option value="staff">Staff</option>
            <option value="admin">Admin</option>
        </select>

        <input type="submit" value="Register">
    </form>
</div>

<footer>
    &copy; 2025 Pahana Edu Bookshop. All Rights Reserved.
</footer>
</body>
</html>
