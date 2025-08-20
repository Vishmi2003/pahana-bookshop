<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Staff - Pahana Edu Bookshop</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #FBE9E7 0%, #FFF3E0 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #4E342E;
        }
        .form-container {
            background: rgba(255,255,255,0.85);
            backdrop-filter: blur(8px);
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 400px;
        }
        h2 { text-align: center; margin-bottom: 25px; }
        label { display: block; margin-top: 12px; font-weight: bold; }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #4E342E, #6D4C41);
            color: #FFD54F;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: linear-gradient(90deg, #FFD54F, #ffca28);
            color: #4E342E;
        }
        .back { margin-top: 15px; text-align: center; }
        .back a { color: #4E342E; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Staff</h2>
    <form action="StaffServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" required>

        <label for="role">Role:</label>
        <select name="role" id="role" required>
            <option value="">Select Role</option>
            <option value="Admin">Admin</option>
            <option value="Staff">Staff</option>
        </select>

        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <button type="submit">Add Staff</button>
    </form>
    <div class="back">
        <a href="manageStaff.jsp">⬅ Back to Staff List</a>
    </div>
</div>
</body>
</html>
