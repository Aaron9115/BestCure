package com.islington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.islington.config.DbConfig;
import com.islington.model.UserModel;

public class RegisterService {
    public Boolean addUser(UserModel userModel) {
        String query = "INSERT INTO user (first_name, last_name, username, email, phone_number, password, gender) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection dbConn = DbConfig.getDbConnection();
             PreparedStatement stmt = dbConn.prepareStatement(query)) {

            stmt.setString(1, userModel.getFirstName());
            stmt.setString(2, userModel.getLastName());
            stmt.setString(3, userModel.getUsername());
            stmt.setString(4, userModel.getEmail());
            stmt.setString(5, userModel.getPhoneNumber());
            stmt.setString(6, userModel.getPassword()); // Already hashed in controller
            stmt.setString(7, userModel.getGender());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error while registering user: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }
}
