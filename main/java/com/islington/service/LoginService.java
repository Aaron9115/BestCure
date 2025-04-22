package com.islington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.islington.config.DbConfig;
import com.islington.model.UserModel;
import com.islington.util.PasswordUtil;

public class LoginService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    public LoginService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    public Boolean loginUser(UserModel userModel) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "SELECT password FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUsername());
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                // Retrieve the stored password hash from the database
                String storedHash = result.getString("password");

                // Verify the password by hashing the input and comparing it with the stored hash
                if (PasswordUtil.verifyPassword(userModel.getPassword(), storedHash)) {
                    return true;  // Passwords match
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return false;  // Passwords don't match or user doesn't exist
    }
}
