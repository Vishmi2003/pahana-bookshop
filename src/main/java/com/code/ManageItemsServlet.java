package com.code;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ManageItemsServlet")
public class ManageItemsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection method
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop", "root", "password");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try (Connection con = getConnection()) {
            if ("add".equals(action)) {
                addItem(request, con);
            } else if ("edit".equals(action)) {
                editItem(request, con);
            }
            response.sendRedirect("manageItems.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageItems.jsp?error=server");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if ("delete".equals(action) && idStr != null) {
            try (Connection con = getConnection()) {
                int id = Integer.parseInt(idStr);
                PreparedStatement ps = con.prepareStatement("DELETE FROM items WHERE id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("manageItems.jsp");
    }

    // Add new item
    private void addItem(HttpServletRequest request, Connection con) throws SQLException {
        String name = request.getParameter("book_name");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        PreparedStatement ps = con.prepareStatement(
                "INSERT INTO items(book_name, author, price, quantity) VALUES (?, ?, ?, ?)"
        );
        ps.setString(1, name);
        ps.setString(2, author);
        ps.setDouble(3, price);
        ps.setInt(4, quantity);
        ps.executeUpdate();
    }

    // Edit existing item
    private void editItem(HttpServletRequest request, Connection con) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("book_name");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        PreparedStatement ps = con.prepareStatement(
                "UPDATE items SET book_name=?, author=?, price=?, quantity=? WHERE id=?"
        );
        ps.setString(1, name);
        ps.setString(2, author);
        ps.setDouble(3, price);
        ps.setInt(4, quantity);
        ps.setInt(5, id);
        ps.executeUpdate();
    }
}
