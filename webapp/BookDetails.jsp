<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${book.name}- Book Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.book-details-container {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 30px;
}

.book-image {
	max-height: 400px;
	object-fit: contain;
}

.book-info {
	padding: 20px;
}

.action-buttons {
	margin-top: 20px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="book-details-container">
			<div class="row">
				<div class="col-md-4">
					<img src="/getBookImage?name=${book.name}" class="book-image w-100"
						alt="${book.name}">
				</div>
				<div class="col-md-8 book-info">
					<h1 class="mb-4">${book.name}</h1>
					<p class="text-muted">by ${book.aname}</p>
					<hr>
					<h4 class="mb-3">${book.price}</h4>
					<p>
						<strong>Publisher:</strong> ${book.pname}
					</p>
					<p>
						<strong>Category:</strong> ${book.category}
					</p>
					<p>
						<strong>Description:</strong>
					</p>
					<p>${book.description}</p>

					<div class="action-buttons">
						<c:choose>
							<c:when test="${isLoggedIn}">
								<form action="/viewBook" method="post" target="_blank"
									class="d-inline">
									<input type="hidden" name="name" value="${book.name}">
									<button type="submit" class="btn btn-primary me-2">Read
										Book</button>
								</form>
								<form action="/downloadBook" method="post" class="d-inline">
									<input type="hidden" name="name" value="${book.name}">
									<button type="submit" class="btn btn-success">Download
										Book</button>
								</form>
							</c:when>
							<c:otherwise>
								<p class="text-danger">
									Please <a href="/Userlogin">log in</a> to read or download this
									book.
								</p>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
