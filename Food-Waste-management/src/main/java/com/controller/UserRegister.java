package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserRegister.jsp");

        String name = request.getParameter("name");
        
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String confirmPassword = request.getParameter("re-pass");
        String contact = request.getParameter("contact");
       

       
        PreparedStatement pstm = null;
        
       
        try {
        	  Class.forName("com.mysql.cj.jdbc.Driver");
              Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/food?useSSL=false&allowPublicKeyRetrieval=true", "root", "DB_PASSWORD_PLACEHOLDER");
              

            // Prepare the SQL query
            String sql = "INSERT INTO users (name,  email, password_hash, password_salt, phone) VALUES (?, ?, ?, ?, ?)";
            pstm  = connection1.prepareStatement(sql);
            
            // Generate salt and hash the password with salt
            String salt = generateSalt();
            String hashedPassword = hashPassword(password, salt);
           
            
            // Set the PreparedStatement parameters
           pstm .setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, hashedPassword);  // Store the hashed password
            pstm.setString(4, salt);  // Store the salt
           pstm .setString(5, contact);

           // Execute the SQL update
           int rows = pstm.executeUpdate();
           if (rows > 0) {
               request.setAttribute("status", "success");
               dispatcher.forward(request, response);
               
           } else {
               request.setAttribute("status", "failed");
           }

       } catch (SQLException | ClassNotFoundException e) {
           e.printStackTrace();
           out.println("Database connection error: " + e.getMessage());
           request.setAttribute("status", "failed");
       } finally {
           if (pstm != null) {
               try {
                   pstm.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
       }

        
        
        // Forward the request and response
        dispatcher.forward(request, response);
    }

    /**
     * Generates a random salt.
     */
    private String generateSalt() {
        try {
            SecureRandom sr = new SecureRandom();
            byte[] salt = new byte[16];  // 16-byte salt
            sr.nextBytes(salt);
            StringBuilder sb = new StringBuilder();
            for (byte b : salt) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();  // Return the salt as a hexadecimal string
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * Hashes the password with the salt using SHA-256.
     */
    private String hashPassword(String password, String salt) {
        try {
            // Combine the password and salt
            String passwordWithSalt = password + salt;
            
            // Initialize SHA-256 hashing algorithm
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            
            // Perform the hash on the combined password + salt bytes
            byte[] hashedByte = md.digest(passwordWithSalt.getBytes());
            
            // Convert the hashed bytes to a hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedByte) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}