<%@taglib prefix="c" uri="jakarta.tags.core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${appName} - Book Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .book-card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .book-card h5 {
            color: #333;
            font-weight: bold;
        }
        .book-card p {
            font-size: 1.1rem;
            color: #666;
        }
        .book-card .label {
            font-weight: bold;
            color: #333;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        hr {
            border-top: 2px solid #ccc;
            width: 50%;
            margin: 20px auto;
        }
    </style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>

<!-- Message Section -->
	<c:if test="${not empty msg}">
		<div class="alert alert-info text-center">${msg}</div>
	</c:if>
	
        <!-- Books Section -->
       <div class="container mt-5">
        <div class="row">
            <c:forEach var="b" items="${books}">
                <div class="col-md-3 col-sm-6">
                    <div class="card product-card">
                      <!-- Books.jsp -->
                  <a href="/bookDetails?name=${b.name}" >  <img src="/getBookImage?name=${b.name}" class="card-img-top product-image" alt="${book.name}" Height="200">
                     </a>
                    <div class="card-body">
                           <h5 class="card-title product-name">${b.name}</h5>
                            <p class="card-title product-name">${b.aname}</p>
                            <p class="card-text product-price">${b.pname}</p>
                            <form action="/bookDetails" method="get">
                            <a href="/bookDetails?name=${b.name}" class="btn btn-primary">View Details</a>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
