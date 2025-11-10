<%@taglib prefix="c" uri="jakarta.tags.core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(135deg, #00b894, #6c5ce7);
}
</style>
</head>
<body>
	
	<div class="d-flex justify-content-center align-items-center vh-100 ">
		<div class="card p-5 shadow-sm mt-2"
			style="width: 100%; max-width: 400px;">
			<c:if test="${msg!=null}">
				<div class="alert alert-warning alert-dismissible fade show"
					role="alert">
					<strong>Message: </strong> ${msg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<h2 class="mb-2 text-center">Admin Login</h2>
			<hr class="border border-dark">

			<form action="adminLogin" method="post" class="mt-3">
				<div class="mb-3">
					<input type="text" id="adminUsername" name="id" maxlength="30"
						class="form-control" placeholder="Enter admin id" required>
				</div>
				<div class="mb-3">
					<input type="password" id="adminPassword" name="password"
						maxlength="30" class="form-control"
						placeholder="Enter admin password" required>
				</div>
				<button type="submit" class="btn btn-custom w-100 py-2"
					style="background: linear-gradient(135deg, #00b894, #6c5ce7);">Login</button>
			</form>

				<div class="text-center mt-3">
					<a href="" data-bs-toggle="modal"
						data-bs-target="#forgetPasswordModal" class="text-decoration-none">Forgot
						Password?</a>
				</div>
				<div class="text-center mt-3">
				<a href="index.jsp" class="text-decoration-none text-secondary">Back
					to Home</a>
			</div>
				<!-- Modal -->
				<div class="modal fade" id="forgetPasswordModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header bg-light text-dark text-center">
								<h1 class="modal-title  fs-5" id="exampleModalLabel">Forget
									Password</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="forgetPassword" method="post">
									<div class="mb-3">
										<input type="email" name="email" maxlength="30"
											class="form-control"
											placeholder="Enter your registered Email id" required>
									</div>
									<button type="submit" class="btn text-white"
										style="background: linear-gradient(135deg, #00b894, #6c5ce7);">Submit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</html>
