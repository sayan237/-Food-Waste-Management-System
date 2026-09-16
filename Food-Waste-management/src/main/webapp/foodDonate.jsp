<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
   
    String emailid = (String) session.getAttribute("email");
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String message = ""; 

    // Database connection
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "DB_PASSWORD_PLACEHOLDER");
        
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String foodname = request.getParameter("foodname");
            String meal = request.getParameter("meal");
            String category = request.getParameter("image-choice");
            String quantity = request.getParameter("quantity");
            String phoneno = request.getParameter("phoneno");
            String district = request.getParameter("district");
            String address = request.getParameter("address");
            String nameParam = request.getParameter("name");

            String query = "INSERT INTO food_donations (email, food, type, category, phoneno, location, address, name, quantity)  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailid);
            preparedStatement.setString(2, foodname);
            preparedStatement.setString(3, meal);
            preparedStatement.setString(4, category);
            preparedStatement.setString(5, phoneno);
            preparedStatement.setString(6, district);
            preparedStatement.setString(7, address);
            preparedStatement.setString(8, nameParam);
            preparedStatement.setString(9, quantity);
           

            int rows = preparedStatement.executeUpdate();
            if (rows > 0) {
                request.setAttribute("status","success");
                
                
            } else {
                request.setAttribute("status","failed");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "An error occurred: " + e.getMessage();
    } finally {
        if (preparedStatement != null) try { preparedStatement.close(); } catch (Exception e) {}
        if (connection != null) try { connection.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Donate</title>
    <link rel="stylesheet" href="css/foodDonate.css">
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
<body style="background-color: #06C167;">
    <div class="container">
        <div class="regformf">
            <form action="" method="post">
                <p class="logo">Food <b style="color: #06C167;">Donate</b></p>
                
                <div class="input">
                    <label for="foodname">Food Name:</label>
                    <input type="text" id="foodname" name="foodname" required/>
                </div>
                
                <div class="radio">
                    <label for="meal">Meal type:</label>
                    <br><br>
                    <input type="radio" name="meal" id="veg" value="veg" required/>
                    <label for="veg" style="padding-right: 40px;">Veg</label>
                    <input type="radio" name="meal" id="Non-veg" value="Non-veg"/>
                    <label for="Non-veg">Non-veg</label>
                </div>
                <br>
                <div class="input">
                    <label for="food">Select the Category:</label>
                    <br><br>
                    <div class="image-radio-group">
                        <input type="radio" id="raw-food" name="image-choice" value="raw-food"/>
                        <label for="raw-food"><img src="img/raw-food.png" alt="raw-food"></label>
                        <input type="radio" id="cooked-food" name="image-choice" value="cooked-food" checked/>
                          <label for="cooked-food"><img src="img/cooked-food.png" alt="cooked-food"></label>
                        <input type="radio" id="packed-food" name="image-choice" value="packed-food"/>
                        <label for="packed-food"><img src="img/packed-food.png" alt="packed-food"></label>
                    </div>
                    <br>
                </div>
                <div class="input">
                    <label for="quantity">Quantity (number of persons / kg):</label>
                    <input type="text" id="quantity" name="quantity" required/>
                </div>
                <b><p style="text-align: center;">Contact Details</p></b>
                <div class="input">
                    <div>
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" <%-- value="<%= name %>" --%> required/>
                    </div>
                    <div>
                        <label for="phoneno">Phone No:</label>
                        <input type="text" id="phoneno" name="phoneno" maxlength="10" pattern="[0-9]{10}" required/>
                    </div>
                </div>
                <div class="input">
                     <label for="location"></label>
                    <label for="district">District:</label>
                    <select id="district" name="district" style="padding:10px;">
                    
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

                    <label for="address" style="padding-left: 10px;">Address:</label>
                    <input type="text" id="address" name="address" required/><br>
                    
				 </div>
				 
                 
               
                <div class="btn">
                    <button type="submit" name="submit">Submit</button>
                </div>
                <div>
                    <p style="color: red;"><%= message %></p>
                </div>
            </form>
        </div>
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