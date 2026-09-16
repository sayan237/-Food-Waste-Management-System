<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page session="true" %>
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
<%
    // Database connection
    String url = "jdbc:mysql://localhost:3306/food";
    String user = "root";
    String password = "DB_PASSWORD_PLACEHOLDER";
    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Check if user is logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    } 
%>

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
           
            <li><a href="#">
                <i class="uil uil-heart"></i>
                <span class="link-name">Donates</span>
            </a></li>
            <li><a href="AdminUserFeedback.jsp">
                <i class="uil uil-comments"></i>
                <span class="link-name">Feedbacks</span>
            </a></li>
           
        </ul>
        
        <ul class="logout-mode">
           <!--  <li><a href="../logout.jsp">
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
        <p class="user"></p>
    </div>
    <br>
    <br>
    <br>

    <div class="activity">
        <div class="location">
            <form method="post">
                <label for="location" class="logo">Select Location:</label>
                <select id="location" name="location">
                    <option value="Kolkata">Kolkata</option>
                     <option value="South 24 Parganas">South 24 Parganas</option>
                    <option value="North 24 Parganas">North 24 Parganas</option>
                    <option value="Purulia">Purulia</option>
                    <option value="Paschim Medinipur">Paschim Medinipur</option>
                    <option value="Purba Medinipur">Purba Medinipur</option>
                    <option value="Howrah">Howrah</option>
                    <option value="Hooghly">Hooghly</option>
                    <option value="Other">Other</option>
                </select>
                <input type="submit" value="Get Details">
            </form>
            <br>

            <%
                // Get the selected location from the form
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String location = request.getParameter("location");
                    String sql = "SELECT * FROM food_donations WHERE location=?";
                    PreparedStatement pstmt = connection.prepareStatement(sql);
                    pstmt.setString(1, location);
                    ResultSet result = pstmt.executeQuery();

                    // If there are results, display them in a table
                    if (result.next()) {
                        // Create the table to display results
                        out.println("<div class=\"table-container\">");
                        out.println("    <div class=\"table-wrapper\">");
                        out.println("        <table class=\"table\">");
                        out.println("            <thead>");
                        out.println("                <tr>");
                        out.println("                    <th>Name</th>");
                        out.println("                    <th>Food</th>");
                        out.println("                    <th>Category</th>");
                        out.println("                    <th>Phone No</th>");
                        out.println("                    <th>Date/Time</th>");
                        out.println("                    <th>Address</th>");
                        out.println("                    <th>Quantity</th>");
                        out.println("                </tr>");
                        out.println("            </thead>");
                        out.println("            <tbody>");

                        do {
                            out.println("<tr>");
                            out.println("<td data-label=\"name\">" + result.getString("name") + "</td>");
                            out.println("<td data-label=\"food\">" + result.getString("food") + "</td>");
                            out.println("<td data-label=\"category\">" + result.getString("category") + "</td>");
                            out.println("<td data-label=\"phoneno\">" + result.getString("phoneno") + "</td>");
                            out.println("<td data-label=\"date\">" + result.getString("date") + "</td>");
                            out.println("<td data-label=\"address\">" + result.getString("address") + "</td>");
                            out.println("<td data-label=\"quantity\">" + result.getString("quantity") + "</td>");
                            out.println("</tr>");
                        } while (result.next());

                        out.println("            </tbody>");
                        out.println("        </table>");
                        out.println("    </div>");
                        out.println("</div>");
                    } else {
                        out.println("<p>No results found.</p>");
                    }
                }
            %>
        </div>
    </div>
</section>

<script>
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