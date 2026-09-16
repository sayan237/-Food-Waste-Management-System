<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import=" java.util.*, java.util.List, java.util.ArrayList" %>
    <%@ page session="true" %>
    
     <%
    // Check if user is logged in
     if (session.getAttribute("username") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    } 

    // Database connection
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    // Database connection
    String url = "jdbc:mysql://localhost:3306/food";
    String user = "root";
    String password = "DB_PASSWORD_PLACEHOLDER";
    // Initialize variables
    int totalUsers =0 ;
    int totalFeedbacks = 0;
    int totalDonations = 0;
 // Declare the donations list
    List<Map<String, String>> donations = new ArrayList<>();

   

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
        String query = "SELECT * FROM food_donations"; 
        resultSet = statement.executeQuery(query); 

        // Fetch total users
        
        resultSet = statement.executeQuery("SELECT count(*) as count FROM users");
        if (resultSet.next()) {
            totalUsers = resultSet.getInt("count");
        }
        

        // Fetch feedbacks
        resultSet = statement.executeQuery("SELECT count(*) as count FROM feed");
        if (resultSet.next()) {
            totalFeedbacks = resultSet.getInt("count");
        }

        // Fetch total donations
        resultSet = statement.executeQuery("SELECT COUNT(*) AS count FROM food_donations");
        if (resultSet.next()) {
            totalDonations = resultSet.getInt("count");
        } 
     // Fetch unassigned donations
       String sql = "SELECT * FROM food_donations Where assigned_to IS  NULL  ";
       resultSet = statement.executeQuery(sql);
       

      
          while (resultSet.next()) {
              Map<String, String> donation = new HashMap<>();
              donation.put("name", resultSet.getString("name"));
              donation.put("food", resultSet.getString("food"));
              donation.put("category", resultSet.getString("category"));
              donation.put("phoneno", resultSet.getString("phoneno"));
              donation.put("date", resultSet.getString("date"));
              donation.put("address", resultSet.getString("address"));
              donation.put("quantity", resultSet.getString("quantity"));
              donation.put("Fid", resultSet.getString("Fid"));
              donations.add(donation);
             
          }
    
      

       
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
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
            <span class="logo_name">ADMIN</span>
        </div>
        
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                 <i class="uil uil-estate"></i>
                    <span class="link-name">Dashboard</span>
                </a></li>
                
                <li><a href="AdminDonate.jsp">
                    <i class="uil uil-heart"></i>
                    <span class="link-name">Donates</span>
                </a></li>
                <li><a href="AdminUserFeedback.jsp">
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
            <p class="logo">Food <b style="color: #06C167;">Donate</b></p>
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

              <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-user"></i>
                        <span class="text">Total users</span>
                        <span class="number"><%= totalUsers %></span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Feedbacks</span>
                        <span class="number"><%= totalFeedbacks %></span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-heart"></i>
                        <span class="text">Total donations</span>
                        <span class="number"><%=  totalDonations %></span>
                    </div>
                </div>
            </div>
            
        

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Donations</span>
                </div>
                <div class="get">
                    <div class="table-container">
                        <div class="table-wrapper">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Food</th>
                                        <th>Category</th>
                                        <th>Phone No</th>
                                        <th>Date/Time</th>
                                        <th>Address</th>
                                        <th>Quantity</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Map<String, String> donation : donations) {
                                    %>
                                    <tr>
                                        <td data-label="name"><%= donation.get("name") %></td>
                                        <td data-label="food"><%= donation.get("food") %></td>
                                        <td data-label="category"><%= donation.get("category") %></td>
                                        <td data-label="phoneno"><%= donation.get("phoneno") %></td>
                                        <td data-label="date"><%= donation.get("date") %></td>
                                        <td data-label="address"><%= donation.get("address") %></td>
                                        <td data-label="quantity"><%= donation.get("quantity") %></td>

                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
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