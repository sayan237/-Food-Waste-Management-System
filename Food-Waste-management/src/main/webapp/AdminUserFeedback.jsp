<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page session="true" %>
    <%
    // Check if user is logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    } 

    // Database connection
    String url = "jdbc:mysql://localhost:3306/food";
    String user = "root";
    String password = "DB_PASSWORD_PLACEHOLDER";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
         String query = "SELECT * FROM feed"; 
       resultSet = statement.executeQuery(query); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/Admin.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>Admin Dashboard Panel</title>
</head>
<body>
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <!--<img src="images/logo.png" alt="">-->
            </div>
            <span class="logo_name">ADMIN</span>
        </div>
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="AdminDashboard.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dashboard</span>
                </a></li>
                
                <li><a href="AdminDonate.jsp">
                    <i class="uil uil-heart"></i>
                    <span class="link-name">Donates</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-comments"></i>
                    <span class="link-name">Feedbacks</span>
                </a></li>
             
            </ul>
            <ul class="logout-mode">
                <!-- <li><a href="../logout.jsp">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li> -->
                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                        <span class="link-name">Dark Mode</span>
                    </a>
                    <div class="mode-toggle">
                        <span class="switch"></span>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>
            <p class="logo">Feed<b style="color: #06C167;">back</b></p>
            <p class="user"></p>
        </div>
        <br><br><br>
        <div class="activity">
            <div class="table-container">
                <div class="table-wrapper">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>name</th>
                                <th>email</th>
                                <th>message</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                while (resultSet.next()) {
                                    String name = resultSet.getString("name");
                                    String email = resultSet.getString("email");
                                    String message = resultSet.getString("message");
                            %>
                            <tr>
                                <td data-label="name"><%= name %></td>
                                <td data-label="email"><%= email %></td>
                                <td data-label="message"><%= message %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <script >
    const body = document.querySelector("body"),
    modeToggle = body.querySelector(".mode-toggle");
    sidebar = body.querySelector("nav");
    sidebarToggle = body.querySelector(".sidebar-toggle");

let getMode = localStorage.getItem("mode");
if(getMode && getMode ==="dark"){
  body.classList.toggle("dark");
}

let getStatus = localStorage.getItem("status");
if(getStatus && getStatus ==="close"){
  sidebar.classList.toggle("close");
}

modeToggle.addEventListener("click", () =>{
  body.classList.toggle("dark");
  if(body.classList.contains("dark")){
      localStorage.setItem("mode", "dark");
  }else{
      localStorage.setItem("mode", "light");
  }
});

sidebarToggle.addEventListener("click", () => {
  sidebar.classList.toggle("close");
  if(sidebar.classList.contains("close")){
      localStorage.setItem("status", "close");
  }else{
      localStorage.setItem("status", "open");
  }
})
    </script>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>
