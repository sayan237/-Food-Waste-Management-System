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
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Httpsession = null;

	private boolean validatePassword(String enteredPassword,String storedHash,String storedSalt) {
		String enteredHash=hashPassword(enteredPassword,storedSalt);
		return enteredHash.equals(storedHash);
	}
	private String hashPassword(String password,String salt) {
		try {
			String passwordSalt = password+salt;
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte [] hashedByte = md.digest(passwordSalt.getBytes());
			StringBuilder sb = new StringBuilder();
			for(byte b:hashedByte) {
				sb.append(String.format("%02x",b));
			}
			return sb.toString();
		}catch(Exception e) {
			e.printStackTrace();
			return " ";
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("remember-me");
		
		 RequestDispatcher dispatcher = null;

	        try {
	            // Load the MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");
		
	        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food?useSSL=false", "root", "DB_PASSWORD_PLACEHOLDER")) {
	         String sql = "SELECT * FROM admin WHERE username=?";
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1,username);
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				String storedHash = rs.getString("password_hash");
				String storedSalt = rs.getString("password_salt");
				
				if(validatePassword(password,storedHash,storedSalt)) {
					HttpSession session = request.getSession();
					session.setAttribute("username",username);
					
					if("on".equals(rememberMe)) {
						Cookie myCookie = new Cookie("username",username);
						myCookie.setMaxAge(60*60*24*7);
						response.addCookie(myCookie);
							
						
					}
					request.setAttribute("status","success");
//					response.sendRedirect("AdminDashboard.jsp"); 
					
					 dispatcher = request.getRequestDispatcher("AdminLogin.jsp");
					 
					 
				}else {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("AdminLogin.jsp");
					
				}
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("AdminLogin.jsp");
				
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
