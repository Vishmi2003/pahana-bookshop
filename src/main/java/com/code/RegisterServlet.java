package com.code;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();

        // Read params (names must match register.jsp)
        String idStr          = trimOrNull(request.getParameter("id"));
        String accountNoStr   = trimOrNull(request.getParameter("account_no"));
        String name           = trimOrNull(request.getParameter("name"));
        String address        = trimOrNull(request.getParameter("address"));
        String contactNumber  = trimOrNull(request.getParameter("contact_number"));
        String email          = trimOrNull(request.getParameter("email"));
        String password       = trimOrNull(request.getParameter("password"));
        String confirm        = trimOrNull(request.getParameter("confirmPassword"));
        String role           = trimOrNull(request.getParameter("role"));

        // Basic server-side validation
        if (password == null || !password.equals(confirm)) {
            sendMessage(out, "Registration Failed", "Passwords do not match.", "register.jsp");
            return;
        }
        if (accountNoStr == null || accountNoStr.isEmpty() || name == null || name.isEmpty()
                || email == null || email.isEmpty() || role == null || role.isEmpty()) {
            sendMessage(out, "Registration Failed", "Required fields are missing.", "register.jsp");
            return;
        }

        // Build SQL depending on whether ID provided (your ID is AUTO_INCREMENT)
        final boolean hasId = idStr != null && !idStr.isEmpty();

        // Your columns (exact as in your DB): ID, Account_NO, Name, Address, `contact Number`, email, password, role
        final String sqlWithId =
                "INSERT INTO users (`ID`, `Account_NO`, `Name`, `Address`, `contact Number`, `email`, `password`, `role`) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        final String sqlAutoId =
                "INSERT INTO users (`Account_NO`, `Name`, `Address`, `contact Number`, `email`, `password`, `role`) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(hasId ? sqlWithId : sqlAutoId)) {

            int idx = 1;

            if (hasId) {
                stmt.setInt(idx++, Integer.parseInt(idStr));
            }

            // account_no is INT(11) UNSIGNED in your table
            stmt.setInt(idx++, Integer.parseInt(accountNoStr));
            stmt.setString(idx++, name);
            stmt.setString(idx++, address);                      // Address is nullable
            stmt.setString(idx++, contactNumber);                // `contact Number` is VARCHAR(15), nullable
            stmt.setString(idx++, email);
            stmt.setString(idx++, password);                     // TODO: hash in production
            stmt.setString(idx  , role);                         // last param

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                sendMessage(out, "Registration Successful", "You will be redirected to the login page in 3 seconds...", "login.jsp");
            } else {
                sendMessage(out, "Registration Failed", "Please try again.", "register.jsp");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            // Friendly error for common constraint problems
            String msg = ex.getMessage();
            if (msg != null && msg.toLowerCase().contains("duplicate")) {
                msg = "Duplicate value (email or account number already exists).";
            }
            sendMessage(out, "Error Occurred", msg, "register.jsp");
        } catch (NumberFormatException nfe) {
            sendMessage(out, "Invalid Data", "ID and Account Number must be numeric.", "register.jsp");
        }
    }

    private static String trimOrNull(String s) {
        return s == null ? null : s.trim();
    }

    private static void sendMessage(PrintWriter out, String title, String body, String redirect) {
        out.println("<!DOCTYPE html><html><head><meta charset='UTF-8'><title>" + title + "</title></head>");
        out.println("<body style='font-family:sans-serif;text-align:center;padding:40px;'>");
        out.println("<h2>" + title + "</h2>");
        out.println("<p>" + (body == null ? "" : body) + "</p>");
        out.println("<script>setTimeout(function(){ window.location.href='" + redirect + "'; }, 3000);</script>");
        out.println("</body></html>");
    }
}
