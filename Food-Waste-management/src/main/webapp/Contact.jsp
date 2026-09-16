<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        

        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "DB_PASSWORD_PLACEHOLDER");
             
        if (request.getMethod().equalsIgnoreCase("POST")) {
        	String nameDetails = request.getParameter("name");
            String emailId = request.getParameter("email");
            String allMsg = request.getParameter("message");  
            
        // Prepare SQL query
           String query = "INSERT INTO feed (name, email, message, created_at) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, nameDetails);
            preparedStatement.setString(2, emailId);
            preparedStatement.setString(3, allMsg);
            preparedStatement.setTimestamp(4, new Timestamp(System.currentTimeMillis())); // For created_at
       
            
            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("status","success");
                
            } else {
            	request.setAttribute("status","failed");
            }
        }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>alert('An error occurred: " + e.getMessage() + "');</script>");
        } finally {
            if (preparedStatement != null) try { preparedStatement.close(); } catch (Exception e) {}
            if (connection != null) try { connection.close(); } catch (Exception e) {}
        }
        
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>contact</title>
    <link rel="stylesheet" href="css/Home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/Contact.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    function showAlert(status) {
	    if (status === "success") {
	    	Swal.fire("Congrats", "Data Recorded Successfully", "success").then(() => {
                window.location.href = "index.jsp"; // Change to your redirect page
            });
	    } else if (status === "failed") {
	        Swal.fire("Error", "Oops Data is not Recorded", "error");
	    }
	}
    </script>
	 

</head>


<body>
	<header>
        <div class="logo">Food <b style="color: #06C167;">Donate</b></div>
        <div class="hamburger">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>
        <nav class="nav-bar">
            <ul>
                <li><a href="index.jsp" >Home</a></li>
                <li><a href="About.jsp" >About</a></li>
                <li><a href="#Contact" class="active" >Contact</a></li>
                <li><a href="foodDonate.jsp" >Donate food</a></li>
                <li><a href="UserLogin.jsp" >Login</a></li>
            </ul>
        </nav>
    </header>
    <script>
        hamburger=document.querySelector(".hamburger");
        hamburger.onclick =function(){
            navBar=document.querySelector(".nav-bar");
            navBar.classList.toggle("active");
        }
    </script>
    <section class="cover" >
  <!--   <img src="img/image.jpg" class="img-fluid" alt="..."> -->
        
    </section>
	<p class="heading" style=" margin: 20px;">contact us </p>
    
     
	
   <!-- <h1 class="heading">Contact Us</h1>  -->
   <div class="contact-form"> 
    <form action="" method="post"> <label for="name">Name:</label> 
     <input type="text" id="name" name="name">
     <br> <label for="email">Email:</label> 
     <input type="email" id="email" name="email">
     <br> <label for="message">Message:</label> <textarea id="message" name="message"></textarea>
     <br> 
     <input type="submit" value="Send" name="send"> 
    </form> 
   </div> 
   <div class="contact-info" style="padding: 10px;"> 
    <p>Email: fooddonate123@gmail.com</p> 
    <p>Phone: 55555-45454</p> 
    <p>Address: Techno india main Salt-lake</p> 
   </div> 
       <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">
    
<script type="text/javascript">
        // Get the status attribute from the request
        const status = "<%= request.getAttribute("status") != null ? request.getAttribute("status") : "" %>";
        // Show alert based on the status
        showAlert(status);
    </script>
</body>
</html>