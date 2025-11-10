<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category}- All Books</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />


	<c:if test="${empty books}">
		<div class="empty-cart-container text-center" style="padding-top: 5rem;">
			<i class="bi bi-book-half" style="font-size: 4rem;"></i>
			<h4 class="empty-cart-message">No books found in this category</h4>
			<a href="/" class="btn btn-primary continue-shopping-btn mt-3" >Explore More</a>
		</div>
	</c:if>

	<!-- Books List -->
	<div class="container mt-5">
		<div class="row">
			<c:forEach var="b" items="${books}">
				<div class="col-md-3 col-sm-6">
					<div class="card product-card">
						<!-- Books.jsp -->
						<a href="/bookDetails?name=${b.name}"> <img
							src="/getBookImage?name=${b.name}"
							class="card-img-top product-image" alt="${cloth.name}"
							Height="200">
						</a>
						<div class="card-body">
							<h5 class="card-title product-name">${b.name}</h5>
							<p class="card-title product-name">${b.aname}</p>
							<form action="/bookDetails" method="get">
								<a href="/bookDetails?name=${b.name}" class="btn btn-primary">View
									Details</a>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
