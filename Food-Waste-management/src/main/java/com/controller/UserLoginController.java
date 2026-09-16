package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLoginController
 */
public class UserLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private boolean validatePassword(String enteredPassword, String storedHash, String storedSalt) {
        String enteredHash = hashPassword(enteredPassword, storedSalt);
        return enteredHash.equals(storedHash);
    }

    private String hashPassword(String password, String salt) {
        try {
            String passwordSalt = password + salt;
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedByte = md.digest(passwordSalt.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedByte) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember-me");
        RequestDispatcher dispatcher = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food?useSSL=false", "root", "DB_PASSWORD_PLACEHOLDER")) {
                String sql = "SELECT * FROM users WHERE email=?";
                PreparedStatement pstm = con.prepareStatement(sql);
                pstm.setString(1, email);
                System.out.println("Executing query");
                ResultSet rs = pstm.executeQuery();
                System.out.println("Query Executed");

                if (rs.next()) {
                    String storedHash = rs.getString("password_hash");
                    String storedSalt = rs.getString("password_salt");

                    if (validatePassword(password, storedHash, storedSalt)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", email);

                        if ("on".equals(rememberMe)) {
                            Cookie myCookie = new Cookie("Username", email);
                            myCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week
                            response.addCookie(myCookie);
                        }
                        request.setAttribute("status","success");
                        dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                        
                    } else {
                        request.setAttribute("status", "failedpass");
                        dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                        
                    }
                } else {
                    request.setAttribute("status", "faileduser");
                    dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                }

                // Forward the request to the appropriate JSP page
                if (dispatcher != null) {
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("UserLogin.jsp");
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }
        }
    }
}