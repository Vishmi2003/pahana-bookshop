package com.code;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/SaveDailyBillsServlet")
public class SaveDailyBillsServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_bookshop";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String billsJson = request.getParameter("bills");
        if (billsJson == null || billsJson.isEmpty()) {
            response.getWriter().write("No bills to save.");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            JSONArray billsArray = new JSONArray(billsJson);

            for (int i = 0; i < billsArray.length(); i++) {
                JSONObject bill = billsArray.getJSONObject(i);

                // Insert into bills table
                String insertBillSql = "INSERT INTO d_bills (grand_total) VALUES (?)";
                try (PreparedStatement psBill = conn.prepareStatement(insertBillSql, Statement.RETURN_GENERATED_KEYS)) {
                    psBill.setDouble(1, bill.getDouble("total"));
                    psBill.executeUpdate();

                    ResultSet rsKeys = psBill.getGeneratedKeys();
                    if (rsKeys.next()) {
                        int billId = rsKeys.getInt(1);

                        // Insert items
                        JSONArray items = bill.getJSONArray("items");
                        String insertItemSql = "INSERT INTO d_bill_items (bill_id, item_name, unit_price, quantity, total) VALUES (?, ?, ?, ?, ?)";
                        try (PreparedStatement psItem = conn.prepareStatement(insertItemSql)) {
                            for (int j = 0; j < items.length(); j++) {
                                JSONObject item = items.getJSONObject(j);
                                psItem.setInt(1, billId);
                                psItem.setString(2, item.getString("name"));
                                psItem.setDouble(3, item.getDouble("unitPrice"));
                                psItem.setInt(4, item.getInt("quantity"));
                                psItem.setDouble(5, item.getDouble("total"));
                                psItem.addBatch();
                            }
                            psItem.executeBatch();
                        }
                    }
                }
            }
            response.getWriter().write("Daily bills saved successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error saving bills: " + e.getMessage());
        }
    }
}
