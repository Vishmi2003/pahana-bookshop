<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");
    if (role == null || !"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Home - Pahana Edu Bookshop</title>
</head>
<body>
<h2>Welcome Admin, <%= (username != null) ? username : "User" %>!</h2>

<ul>
    <li><a href="manageUsers.jsp">Manage Users</a></li>
    <li><a href="manageBooks.jsp">Manage Books</a></li>
    <li><a href="reports.jsp">Reports</a></li>
    <li><a href="settings.jsp">Settings</a></li>
</ul>

<form action="LogoutServlet" method="post">
    <button type="submit">Logout</button>
</form>
</body>
</html>
