<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Admin Login Page</title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<script>
        function showAlert(status) {
            if (status === "failed") {
                Swal.fire("Sorry", "Wrong Username or Password", "error");
            } else if (status === "success") {
            	Swal.fire("Congrats", "Welcome Back", "success").then(() => {
                    window.location.href = "AdminDashboard.jsp"; // Change to your redirect page
                });
            }
        }
    </script>
</head>
<body>

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/si.webp" alt="sing up image">
						</figure>
						<a href="AdminRegister.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="post" action="AdminLogin" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="your UserName" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
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