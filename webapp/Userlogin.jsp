<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(135deg, #00b894, #6c5ce7);
}

.password-toggle {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

.password-container {
	position: relative;
}

.error-message {
	color: #dc3545;
	font-size: 0.875rem;
	margin-top: 0.25rem;
}
</style>
</head>

<body>
	<nav class="navbar custom-navbar navbar-expand-lg navbar-dark px-3">
		<div>
			<a href="/" class="gap-2"> <i
				class="bi bi-arrow-left-circle-fill text-decoration-none"
				style="font-size: 20px; color: white;"></i>
			</a> <a href="/" class="navbar-brand fw-bold text-white">Book Cloud</a>
		</div>
	</nav>

	<div class="d-flex justify-content-center align-items-center vh-100">
		<div class="card p-4 shadow-sm" style="width: 100%; max-width: 400px;">

			<c:if test="${msg!=null}">
				<div class="alert alert-warning alert-dismissible fade show"
					role="alert">
					<strong>Message: </strong> ${msg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<h3 class="text-center mb-2">Login</h3>
			<hr class="border border-dark">

			<form action="Userlogin" method="post" id="loginForm">
				<div class="mb-3">
					<input type="email" class="form-control" name="email"
						id="Useremail" placeholder="Enter your Email ID" required
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
					<div class="error-message" id="emailError"></div>
				</div>
				<div class="mb-3 password-container">
					<input type="password" class="form-control" name="password"
						id="password" maxlength="8" minlength="8"
						placeholder="Enter your password" required> <i
						class="fas fa-eye password-toggle" id="togglePassword"></i>
					<div class="error-message" id="passwordError"></div>
				</div>
				<button type="submit" class="btn btn-dark w-100"
					style="background: linear-gradient(135deg, #00b894, #6c5ce7);"
					id="loginButton">
					<span id="buttonText">Login</span>
					<div class="spinner-border spinner-border-sm d-none" role="status"
						id="loadingSpinner">
						<span class="visually-hidden">Loading...</span>
					</div>
				</button>
				<a href="/oauth2/authorization/google"
					class="btn d-flex align-items-center justify-content-center gap-2 mt-3"
					style="background-color: white; border: 1px solid #ddd;"> <i
					class="bi bi-google"></i> <span>Continue with Google</span>
				</a>
			</form>

			<div class="text-center mt-3">
				<a href="forgotPassword.jsp" class="text-decoration-none">Forgot
					Password?</a>
			</div>

			<div class="text-center mt-3">
				<a href="Register.jsp" class="text-decoration-none">New User?
					Register here</a>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#password');
            const loginForm = document.querySelector('#loginForm');
            const loginButton = document.querySelector('#loginButton');
            const buttonText = document.querySelector('#buttonText');
            const loadingSpinner = document.querySelector('#loadingSpinner');

            // Password visibility toggle
            togglePassword.addEventListener('click', function() {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });

            // Form submission handling
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Show loading state
                buttonText.classList.add('d-none');
                loadingSpinner.classList.remove('d-none');
                loginButton.disabled = true;

                // Submit form after a short delay to show loading state
                setTimeout(() => {
                    this.submit();
                }, 500);
            });

            // Email validation
            const emailInput = document.querySelector('#Useremail');
            emailInput.addEventListener('input', function() {
                const emailError = document.querySelector('#emailError');
                if (!this.validity.valid) {
                    emailError.textContent = 'Please enter a valid email address';
                } else {
                    emailError.textContent = '';
                }
            });
        });
    </script>
</body>

</html>
