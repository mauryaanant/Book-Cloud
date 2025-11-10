<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>User Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
.form-container {
	max-width: 600px;
	margin: 50px auto;
	border: 1px solid #ddd;
	padding: 30px;
	border-radius: 8px;
	background-color: #fff;
	margin-top: 100px;
}

.form-label {
	font-weight: 500;
	font-size: 0.9rem;
	color: #555;
}

.gender-options .form-check {
	display: inline-block;
	margin-right: 20px;
}

.btn-save {
	background-color: #d01616;
	color: #ffffff;
}

.btn-save:hover {
	background-color: #c51e1e;
	color: #ffffff;
}
</style>
</head>

<body>

	<!-- Header Section -->
	<jsp:include page="header.jsp"></jsp:include>

	<main class="container mt-3">
		<div class="form-container shadow-sm">
			<h5 class="mb-4">Edit Details</h5>

			<form action="/updateUserDetails" method="post">
				<!-- Mobile Number and Change -->
				<div class="mb-3 d-flex justify-content-between align-items-center">
					<div style="flex-grow: 1;">
						<label class="form-label">Mobile Number*</label> <input
							type="text" name="phone" class="form-control"
							value="${userLogin.phone}" minlength="10" maxlength="10" />


						<!-- Full Name -->
						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								name="name" class="form-control" placeholder="Enter full name"
								value="${userLogin.name}" />
						</div>

						<!-- Email (Read Only) -->
						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control" value="${userLogin.email}"
								readonly />
						</div>

						<!-- Gender with Radio Buttons -->
						<div class="mb-3">
							<label class="form-label d-block">Gender</label>
							<div class="gender-options">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="genderMale" value="Male"
										<c:if test="${userDetails.gender == 'Male'}">checked</c:if>>
									<label class="form-check-label" for="genderMale">Male</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="genderFemale" value="Female"
										<c:if test="${userDetails.gender == 'Female'}">checked</c:if>>
									<label class="form-check-label" for="genderFemale">Female</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="genderOther" value="Other"
										<c:if test="${userDetails.gender == 'Other'}">checked</c:if>>
									<label class="form-check-label" for="genderOther">Other</label>
								</div>
							</div>
						</div>

						<!-- Date of Birth -->
						<div class="mb-3">
							<label class="form-label"> Date of Birth (dd/mm/yyyy)</label> <input
								class="form-control" type="date" name="dob" id="dob"
								value="<fmt:formatDate	value="${userDetails.dob}" pattern='yyyy-MM-dd' />">
						</div>

						<!-- Save Button -->
						<div class="d-grid mt-4">
							<button type="submit" class="btn btn-save btn-lg" style="background: linear-gradient(135deg, #00b894, #6c5ce7);">SAVE
								DETAILS</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
