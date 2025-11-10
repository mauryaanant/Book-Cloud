<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>

<body style="background: linear-gradient(135deg, #00b894, #6c5ce7);">

	<nav class="navbar custom-navbar navbar-expand-lg navbar-dark px-3">
		<div>
			<a href="/Userlogin" class="gap-2"> <i
				class="bi bi-arrow-left-circle-fill text-decoration-none"
				style="font-size: 20px; color: white;"></i>
			</a> <a href="/" class="navbar-brand fw-bold text-white">Book Cloud</a>
		</div>
	</nav>

	<div class="d-flex justify-content-center align-items-center vh-100 ">

		<div class="card p-4 shadow-sm" style="width: 100%; max-width: 400px;">
			<h3 class="text-center mb-4">Register Here</h3>
			<form action="registerUser" method="post">
				<div class="mb-3">
					<label for="name">Name</label> <input type="text"
						class="form-control" name="name" required />
				</div>
				<div class="mb-3">
					<label for="email">Email</label> <input type="email"
						class="form-control" name="email" required />
				</div>
				<div class="mb-3">
					<label for="phone">Phone</label> <input type="tel"
						class="form-control" name="phone" required />
				</div>
				<div class="mb-3">
					<label for="password">Password (8 characters)</label> <input
						type="password" class="form-control" name="password" minlength="8"
						maxlength="8" required />
				</div>
				<button type="submit" class="btn btn-primary w-100"
					style="background: linear-gradient(135deg, #00b894, #6c5ce7);">Register</button>
				<a href="/oauth2/authorization/google"
					class="btn d-flex align-items-center justify-content-center gap-2 mt-3"
					style="background-color: white; border: 1px solid #ddd;"> <i
					class="bi bi-google"></i> <span>Continue with Google</span>
				</a>
				<div class="text-center mt-3">
					<a href="/Userlogin">Already have an account? Login</a>
				</div>
			</form>
		</div>
	</div>
	<!-- Bootstrap JS (optional for interactivity) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>