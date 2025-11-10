<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header Example</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
.custom-navbar {
	background: linear-gradient(135deg, #00b894, #6c5ce7);
}

.search-input {
	max-width: 400px;
}
</style>
</head>
<body>
	<header>
		<nav class="navbar custom-navbar navbar-expand-lg navbar-dark px-3">
			<div class="container-fluid">
				<a href="/" class="navbar-brand fw-bold text-white">Book Cloud</a>
				<form action="getBooks" method="get" class="d-flex w-50 me-3 ">
					<input class="form-control me-3" type="search" name="name"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-light" type="submit">Search</button>
				</form>

				<!-- Profile Icon Triggering Offcanvas -->
				<div class="me-2">
					<button class="btn d-flex flex-column align-items-center"
						type="button" data-bs-toggle="offcanvas"
						data-bs-target="#profileTab" aria-controls="profileTab">
						<i class="bi bi-person" style="font-size: 25px; color: white;"></i>
						<small class="fst-normal lh-sm text-light">Profile</small>
					</button>
				</div>
			</div>
		</nav>
	</header>

	<!-- Offcanvas Profile Panel -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="profileTab"
	aria-labelledby="profileTabLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="profileTabLabel">Your Profile</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">

		<c:if test="${not empty sessionScope.userLogin}">
			<p class="mb-1">
				<strong>Hello, ${sessionScope.userLogin.name}</strong>
			</p>
			<p class="text-muted small mb-3">${sessionScope.userLogin.phone}</p>

			<div class="list-group">
				<a href="/contact" class="list-group-item list-group-item-action">Contact Us</a>
				<a href="/edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
			</div>

			<form action="/Userlogout" method="post" class="mt-3">
				<button type="submit" class="btn btn w-100 text-light"
					style="background: linear-gradient(135deg, #00b894, #6c5ce7);">Logout</button>
			</form>
			<br>
		</c:if>

		<c:if test="${empty sessionScope.userLogin}">
			<form action="/Userlogin" method="get">
				<button type="submit" class="btn btn w-100 text-light"
					style="background: linear-gradient(135deg, #00b894, #6c5ce7);">LOGIN/SIGNUP</button>
			</form>
		</c:if>

	</div>
</div>




	<!-- Bootstrap JS, Popper.js, and icons -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.min.js"></script>
</body>
</html>
