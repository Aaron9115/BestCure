package com.islington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.islington.config.DbConfig;
import com.islington.model.UserModel;
import com.islington.model.ProductModel;

public class DashboardService {

    private Connection dbConn;

    public DashboardService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // Retrieve the most recent users (e.g., last 10 registered users)
    public List<UserModel> getRecentUsers() {
        List<UserModel> users = new ArrayList<>();
        String query = "SELECT * FROM user ORDER BY user_id DESC LIMIT 10"; // Assuming you want to get the latest 10 users

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                UserModel user = new UserModel(
                        result.getInt("user_id"),
                        result.getString("first_name"),
                        result.getString("last_name"),
                        result.getString("username"),
                        result.getString("email"),
                        result.getString("gender"),
                        result.getString("phone_number"),  // Now retrieve as String
                        result.getString("password") // Assuming you're storing the password (hashed) here
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Get the total number of users
    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM user";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                return result.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get total products in the inventory
    public int getTotalProducts() {
        String query = "SELECT COUNT(*) FROM product";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                return result.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get users in specific categories (replace with actual category logic)
    public int getComputingUsers() {
        return getUsersByCategory("computing"); // Assuming you have some category logic, adapt it as needed
    }

    public int getMultimediaUsers() {
        return getUsersByCategory("multimedia");
    }

    public int getNetworkingUsers() {
        return getUsersByCategory("networking");
    }

    // Example for category-based user counts
    private int getUsersByCategory(String category) {
        String query = "SELECT COUNT(*) FROM user WHERE user_category = ?"; // Make sure `user_category` is valid column
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, category);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                return result.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Method to get all products (optional, if you want to display products)
    public List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT * FROM product";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                ProductModel product = new ProductModel(
                        result.getInt("product_id"),
                        result.getString("product_name"),
                        result.getString("product_category"),
                        result.getString("product_description"),
                        result.getDouble("product_price"),
                        result.getInt("product_quantity")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}
