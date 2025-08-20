package com.code;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_bookshop";
    private static final String DB_USER = "root"; // your DB username
    private static final String DB_PASSWORD = ""; // your DB password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        // If username or password is empty, redirect back
        if (username.isEmpty() || password.isEmpty()) {
            response.sendRedirect("Login.jsp?msg=fail");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to DB
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL: match by either email or account number
            String sql = "SELECT * FROM users WHERE (email = ? OR Account_NO = ?) AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, username);
            stmt.setString(3, password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                // Valid login
                HttpSession session = request.getSession();
                session.setAttribute("userID", rs.getInt("ID"));
                session.setAttribute("accountNo", rs.getInt("Account_NO"));
                session.setAttribute("name", rs.getString("Name"));
                session.setAttribute("role", rs.getString("role"));

                // Redirect based on role
                String role = rs.getString("role");
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if ("staff".equalsIgnoreCase(role)) {
                    response.sendRedirect("staffDashboard.jsp");
                } else if ("user".equalsIgnoreCase(role)) {
                    response.sendRedirect("userDashboard.jsp");
                }
            } else {
                // Invalid login
                response.sendRedirect("Login.jsp?msg=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?msg=error");

        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
}
