package com.code;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BillingServlet")
class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerId = request.getParameter("customerId");
        String[] bookIds = request.getParameterValues("bookId");
        String[] quantities = request.getParameterValues("quantity");
        String[] prices = request.getParameterValues("price");

        if (customerId == null || bookIds == null || quantities == null || prices == null) {
            response.sendRedirect("billing.jsp?error=invalid");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // 1️⃣ Insert into bills table
            String billSql = "INSERT INTO bills(customer_id, total_amount, date) VALUES (?, ?, ?)";
            double totalAmount = 0;

            for (int i = 0; i < bookIds.length; i++) {
                totalAmount += Double.parseDouble(prices[i]) * Integer.parseInt(quantities[i]);
            }

            int billId = 0;
            try (PreparedStatement psBill = con.prepareStatement(billSql, Statement.RETURN_GENERATED_KEYS)) {
                psBill.setInt(1, Integer.parseInt(customerId));
                psBill.setDouble(2, totalAmount);
                psBill.setDate(3, Date.valueOf(LocalDate.now()));

                int rows = psBill.executeUpdate();
                if (rows == 0) throw new SQLException("Failed to insert bill");

                try (ResultSet rs = psBill.getGeneratedKeys()) {
                    if (rs.next()) billId = rs.getInt(1);
                }
            }

            // 2️⃣ Insert into bill_items table (each purchased book)
            String itemSql = "INSERT INTO bill_items(bill_id, book_id, quantity, price, total) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement psItem = con.prepareStatement(itemSql)) {
                for (int i = 0; i < bookIds.length; i++) {
                    int bookId = Integer.parseInt(bookIds[i]);
                    int qty = Integer.parseInt(quantities[i]);
                    double price = Double.parseDouble(prices[i]);
                    double total = price * qty;

                    psItem.setInt(1, billId);
                    psItem.setInt(2, bookId);
                    psItem.setInt(3, qty);
                    psItem.setDouble(4, price);
                    psItem.setDouble(5, total);
                    psItem.addBatch();

                    // 3️⃣ Update stock in books table
                    try (PreparedStatement psUpdate = con.prepareStatement(
                            "UPDATE books SET quantity = quantity - ? WHERE id = ?")) {
                        psUpdate.setInt(1, qty);
                        psUpdate.setInt(2, bookId);
                        psUpdate.executeUpdate();
                    }
                }
                psItem.executeBatch();
            }

            con.commit();
            response.sendRedirect("billing.jsp?success=true&billId=" + billId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("billing.jsp?error=server");
        }
    }
}
