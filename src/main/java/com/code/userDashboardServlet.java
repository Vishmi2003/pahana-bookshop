package com.code;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UserDashboardServlet")
class UserDashboardServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/pahana_bookshop";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            // Use context path to avoid path issues
            response.sendRedirect(request.getContextPath() + "/Login.jsp?error=PleaseLoginFirst");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try {
            // Load MySQL Driver (optional for newer JDBC)
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {

                String sql = "SELECT * FROM users WHERE ID=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Store user info as request attributes for JSP
                    request.setAttribute("id", rs.getInt("ID"));
                    request.setAttribute("accountNo", rs.getInt("Account_NO"));
                    request.setAttribute("name", rs.getString("Name"));
                    request.setAttribute("address", rs.getString("Address"));
                    request.setAttribute("contactNumber", rs.getString("contact Number")); // check DB column name
                    request.setAttribute("email", rs.getString("email"));
                    request.setAttribute("role", rs.getString("role"));
                }

                // Forward to JSP in the webapp root
                request.getRequestDispatcher("/userDashboard.jsp").forward(request, response);

            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp?msg=DriverNotFound");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp?msg=DatabaseError");
        }
    }
}
