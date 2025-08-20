package com.code;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/pahana_bookshop";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    private static DBConnection instance;
    private static Connection connection;

    public DBConnection() {
        try {
            Class.forName(DRIVER);
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            // Handle the case where the JDBC driver is not found
            System.err.println("JDBC Driver not found: " + DRIVER);
            throw new RuntimeException("JDBC Driver not found.", e);
        } catch (SQLException e) {
            // Handle database connection errors
            System.err.println("SQL Exception: " + e.getMessage());
            throw new RuntimeException("Error initializing DBConnection.", e);
        }
    }

    public static synchronized DBConnection getInstance() {
        if (instance == null) {
            instance = new DBConnection();
        }
        return instance;
    }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }
}