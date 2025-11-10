<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Add Book</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.sidebar {
	background: linear-gradient(135deg, #00b894, #6c5ce7);
	min-height: 100vh;
	position: fixed;
}

.offcanvas-body .list-group-item {
	background-color: transparent;
	transition: background-color 0.3s ease;
}

.offcanvas-body .list-group-item:hover {
	background-color: lightgray;
}

.container {
	margin-top: 30px;
	max-width: 600px;
	background: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
	color: #000;
}

hr {
	background-color: grey;
	height: 3px;
}
</style>
</head>
<body>
	<!-- Navigation Bar -->
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<nav class="col-md-3 col-lg-2 d-md-block sidebar p-4">
				<div class="mb-4">
					<a href="/" class="text-decoration-none">
						<h4 class="fw-bold text-light">Book Cloud</h4>
					</a>
				</div>
				<div class="offcanvas-body">
					<p class="mb-4">
						<strong>Hello, ${sessionScope.name}</strong>
					</p>
					<div class="list-group">
						<a href="adminHome" class="list-group-item list-group-item-action">Home</a>
						<a href="allBook" class="list-group-item list-group-item-action">All
							Books</a> <a href="" class="list-group-item list-group-item-action"
							data-bs-toggle="modal" data-bs-target="#passwordModal">Change
							Password</a> <a href="/about"
							class="list-group-item list-group-item-action">About Us</a> <a
							href="/privacypolicy"
							class="list-group-item list-group-item-action">Privacy Policy</a>
					</div>

					<form action="Adminlogout" method="get" class="mt-3">
						<button type="submit" class="btn btn-light w-100 text-dark">Logout</button>
					</form>
				</div>
			</nav>
			<!-- Main Content -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<c:if test="${msg != null}">
					<div class="alert alert-warning alert-dismissible fade show"
						role="alert">
						<strong>Message:</strong> ${msg}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<div class="container text-start">
					<div class="row mb-3 ">
						<div class="col-sm-6">
							<img alt="book image" src="/getBookImage?name=${b.name}"
								height="100px"> <br>
							<form action="updateBookImage" enctype="multipart/form-data"
								method="post">
								<input type="hidden" name="name" value="${b.name}"> <input
									type="file" name="image" accept=".jpg,.png"
									class="form-control" required> <br>
								<button class="btn btn-primary" type="submit">Change
									Image</button>
							</form>
						</div>
						<div class="col-sm-6">
							<form action="updateBook" method="post" class="mt-4">
								<div class="mb-3">
									<span>Name:</span> <input type="text" name="name"
										value="${b.name}" maxlength="30" class="form-control"
										placeholder="Book name" readonly />
								</div>
								<div class="mb-3">
									<span>Price:</span> <input type="number" name="price"
										value="${b.price}" max="30000" min="0" class="form-control"
										placeholder="Book price" required />
								</div>
								<div class="mb-3">
									<span>Author Name:</span> <input type="text" name="aname"
										value="${b.aname}" maxlength="30" class="form-control"
										placeholder="Book author" required />
								</div>

								<div class="mb-3">
									<span>Publisher Name:</span> <input type="text" name="pname"
										value="${b.pname}" maxlength="30" class="form-control"
										placeholder="Book publisher" required />
								</div>

								<div class="mb-3">
									<span>Book's Category:</span> <input type="text" name="category"
										value="${b.category}" maxlength="30" class="form-control"
										placeholder="Book's Category" required />
								</div>

								<div class="mb-3">
									<span>Book's Description:</span> <input type="text"
										name="description" value="${b.description}" maxlength="30"
										class="form-control" placeholder="Book's Description" required />
								</div>

								<button type="submit" class="btn btn-custom w-100 py-2"
									style="background: linear-gradient(135deg, #00b894, #6c5ce7);">Update
									Book</button>
							</form>
							<hr>
							<form action="deleteBook" method="post">
								<input type="hidden" name="name" value="${b.name}">
								<button class="btn btn-danger" type="submit">Delete
									Book</button>
							</form>
						</div>
					</div>

				</div>
			</main>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="passwordModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-info text-white">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Change
						Password</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="mb-3">
							<input type="password" name="opass" maxlength="30"
								class="form-control" placeholder="Enter old password" required>
						</div>
						<div class="mb-3">
							<input type="password" name="npass" maxlength="30"
								class="form-control" placeholder="Enter new password" required>
						</div>
						<div class="mb-3">
							<input type="password" name="rpass" maxlength="30"
								class="form-control" placeholder="Re-Enter new password"
								required>
						</div>
						<button type="submit" class="btn btn-info">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
