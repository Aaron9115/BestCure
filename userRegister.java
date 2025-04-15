package com.islington.servlet;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.islington.config.DbConfig;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class userRegister {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public userRegister() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new student in the database.
	 *
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addStudent(com.islington.modal.bestPharma bestPharma) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		String programQuery = "SELECT program_id FROM program WHERE name = ?";
		String insertQuery = "INSERT INTO client (first_name, last_name, username, dob, gender, email, number, password, program_id, image_path) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement programStmt = dbConn.prepareStatement(programQuery);
				PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {

			

			// Insert student detailss
			insertStmt.setString(1, bestPharma.getFirstName());
			insertStmt.setString(2, bestPharma.getLastName());
			insertStmt.setString(3, bestPharma.getUserName());
			insertStmt.setDate(4, Date.valueOf(bestPharma.getDob()));
			insertStmt.setString(5, bestPharma.getGender());
			insertStmt.setString(6, bestPharma.getEmail());
			insertStmt.setString(7, bestPharma.getNumber());
			insertStmt.setString(8, bestPharma.getPassword());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during student registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}