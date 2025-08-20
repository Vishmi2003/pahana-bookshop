package com.code;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet("/ManageStaffServlet")
public class ManageStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT id, name, email, phone, role, username FROM staff";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Staff s = new Staff();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setRole(rs.getString("role"));
                s.setUsername(rs.getString("username"));
                staffList.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.setAttribute("staffList", staffList);
        // ✅ Ensure correct JSP path
        RequestDispatcher rd = request.getRequestDispatcher("/manageStaff.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            String idParam = request.getParameter("id");
            try {
                int id = Integer.parseInt(idParam);

                String sql = "DELETE FROM staff WHERE id = ?";
                try (Connection conn = DBConnection.getInstance().getConnection();
                     PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    ps.executeUpdate();
                }

            } catch (NumberFormatException nfe) {
                request.setAttribute("errorMessage", "Invalid staff id.");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error deleting staff: " + e.getMessage());
            }
        }

        // Redirect back to the servlet (reload staff list)
        response.sendRedirect(request.getContextPath() + "/ManageStaffServlet");
    }
}
