<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register Page</title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<script>
function validateForm() {
    let val1 = document.getElementById("pass").value;
    let val2 = document.getElementById("re_pass").value;
    if (val1 !== val2) {
        alert("Your passwords don't match");
        return false;
    }
    return true;
}

function showAlert(status) {
    if (status === "success") {
    	Swal.fire("Congrats", "Account Created Successfully", "success").then(() => {
            window.location.href = "index.jsp"; // Change to your redirect page
        });
    } else if (status === "failed") {
        Swal.fire("Error", "Account Creation Failed", "error");
    }
}
	</script>
</head>
<body>
<%-- <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"> --%>

<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="UserRegister" class="register-form"
							id="register-form" onsubmit="return validateForm();">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact" maxlength="10" pattern="[0-9]{10}" required
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="Term&Condition.jsp" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register"  />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/f.webp" alt="sing up image">
						</figure>
						<a href="UserLogin.jsp" class="signup-image-link">I am already
							member</a>
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