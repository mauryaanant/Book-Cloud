<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us | Book Cloud</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .hero {
            background: linear-gradient(135deg, #6c5ce7, #00b894);
            color: white;
            padding: 4rem 2rem;
            border-radius: 0 0 2rem 2rem;
            text-align: center;
        }
        .section {
            padding: 3rem 2rem;
        }
        .icon-box {
            font-size: 2.5rem;
            color: #6c5ce7;
        }
    </style>
</head>
<body>

<div class="hero">
    <h1>About Book Cloud</h1>
    <p class="lead">Your digital library, accessible anytime, anywhere.</p>
</div>

<div class="container section">
    <div class="row text-center mb-5">
        <div class="col-md-4">
            <div class="icon-box mb-2"><i class="bi bi-book-open"></i></div>
            <h5>Read Instantly</h5>
            <p>Browse and read books online with a simple, user-friendly interface — no apps or plugins required.</p>
        </div>
        <div class="col-md-4">
            <div class="icon-box mb-2"><i class="bi bi-download"></i></div>
            <h5>Download with Ease</h5>
            <p>Download your favorite titles in one click and enjoy offline reading at your convenience.</p>
        </div>
        <div class="col-md-4">
            <div class="icon-box mb-2"><i class="bi bi-shield-lock-fill"></i></div>
            <h5>Secure User Accounts</h5>
            <p>We use industry-standard BCrypt encryption to protect your passwords, ensuring your personal data stays safe and private.</p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <h3>Our Mission</h3>
            <p class="mt-3">At Book Cloud, our mission is to make reading easy, modern, and flexible. Whether you're a student, a casual reader, or a book lover, our platform helps you discover and enjoy books the way you want — online or offline, your way. Your data privacy and account security are our top priorities.</p>
        </div>
    </div>
</div>

<footer class="text-center py-4 bg-light mt-5">
    <p class="mb-0">&copy; 2025 Book Cloud. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
