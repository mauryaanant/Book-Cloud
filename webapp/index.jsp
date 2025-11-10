<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Book Cloud</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link href="path/to/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles.css">
<style>
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section class="bg-light text-dark text-center">
		<div class="container mt-3">
			<h2 class="text-center mb-4">DISCOVER THE #1 BESTSELLER TRENDING
				BOOK THIS WEEK</h2>
		</div>
	</section>


	<!-- Carousel + Right Images Section -->
	<div class="container mt-4">
		<div class="row">
			<!-- Left: Carousel -->
			<div class="col-md-8">
				<div id="bookCarousel" class="carousel slide h-100"
					data-bs-ride="carousel">
					<div class="carousel-inner rounded">
						<div class="carousel-item active">
							<img src="img/cover3.jpg" class="d-block w-100" alt="Book 1"
								style="height: 400px; object-fit: cover;">
							
						</div>
						<div class="carousel-item">
							<img src="img/cover6.jpg" class="d-block w-100" alt="Book 2"
								style="height: 400px; object-fit: cover;">
							
						</div>
						<div class="carousel-item">
							<img src="img/cover4.jpg" class="d-block w-100" alt="Book 3"
								style="height: 400px; object-fit: cover;">
							
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#bookCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#bookCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</div>

			<!-- Right: Two Static Images -->
			<div class="col-md-4 d-flex flex-column justify-content-between">
				<img src="img/cover 2.jpg" alt="Promo 1"
					class="img-fluid rounded mb-2"
					style="height: 195px; object-fit: cover;"> <img
					src="img/static2.jpg" alt="Promo 2" class="img-fluid rounded mt-2"
					style="height: 195px; object-fit: cover;">
			</div>
		</div>
	</div>


	<!-- Categories Section -->
	<div class="container mt-5 mb-5">
		<h4 class="text-start mb-4 fst-italic text-muted">Find what you love !</h4>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">

			<!-- Category Card 1 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img src="img/a-book-Photo.jpg" class="card-img-top" alt="Fiction"
						style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Fiction</h6>
						<p class="card-text small">Imaginative storytelling and
							adventures.</p>
						<a href="/getBooksByCategory?category=Fiction"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

			<!-- Category Card 2 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img src="img/technical-books.jpg" class="card-img-top"
						alt="Non-Fiction" style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Non-Fiction</h6>
						<p class="card-text small">Learn from real-life stories, facts
							and experiences.</p>
						<a href="/getBooksByCategory?category=Non-Fiction"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

			<!-- Category Card 3 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img
						src="https://images.unsplash.com/photo-1512820790803-83ca734da794"
						class="card-img-top" alt="Science"
						style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Science & Tech</h6>
						<p class="card-text small">Explore scientific innovations and
							concepts.</p>
						<a href="/getBooksByCategory?category=Science and Technology"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

			<!-- Category Card 4 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img src="img/technical-books.jpg" class="card-img-top"
						alt="Biographies" style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Biographies</h6>
						<p class="card-text small">Inspiring lives of influential
							people and others.</p>
						<a href="/getBooksByCategory?category=Biography and Memoir"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

		</div>
	</div>


	<div class="container mt-5 mb-5">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">

			<!-- Category Card 1 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img src="img/technical-Books2.jpg" class="card-img-top"
						alt="Fiction" style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">History</h6>
						<p class="card-text small">Perfect for those who love
							understanding how the world was shaped.</p>
						<a href="/getBooksByCategory?category=History"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

			<!-- Category Card 2 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img src="img/technical-Books2.jpg" class="card-img-top"
						alt="Non-Fiction" style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Religion and Spirituality</h6>
						<p class="card-text small">This category explores faith,
							spiritual practices, and sacred texts from around the world.</p>
						<a href="/getBooksByCategory?category=Religion and Spirituality"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

			<!-- Category Card 3 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img
						src="https://images.unsplash.com/photo-1512820790803-83ca734da794"
						class="card-img-top" alt="Science"
						style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Science & Tech</h6>
						<p class="card-text small">Explore scientific innovations and
							concepts.</p>
						<a href="/getBooksByCategory?category=Science and Technology"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

			<!-- Category Card 4 -->
			<div class="col">
				<div class="card h-100 text-center shadow-sm">
					<img src="img/technical-books.jpg" class="card-img-top"
						alt="Biographies" style="height: 150px; object-fit: cover;">
					<div class="card-body">
						<h6 class="card-title">Biographies</h6>
						<p class="card-text small">Inspiring lives of influential
							people and others.</p>
						<a href="/getBooksByCategory?category=Biography and Memoir"
							class="btn btn-sm btn-primary">View Details</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
