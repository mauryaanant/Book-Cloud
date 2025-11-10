<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Footer Example</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <!-- Main content of the page -->
  <div class="container">
    <!-- Your page content here -->
  </div>

  <!-- Footer -->
  <footer class="bg-dark text-white py-4 mt-5">
    <div class="container">
      <div class="row">
        <!-- Contact Information -->
        <div class="col-md-4">
          <h5>Contact Us</h5>
          <p>Email: info@yourdomain.com</p>
          <p>Phone: +1 (123) 456-7890</p>
           </br>
           <a href="AdminLogin.jsp" class="text-white">Admin Login</a>
        </div>
        <!-- Quick Links -->
        <div class="col-md-4">
          <h5>Quick Links</h5>
          <ul class="list-unstyled">
            <li><a href="/about" class="text-white">About Us</a></li>
            <li><a href="/privacypolicy" class="text-white">Privacy Policy</a></li>
            <li><a href="/terms" class="text-white">Terms & Conditions</a></li>
          </ul>
        </div>
        <!-- Social Media Links -->
        <div class="col-md-4">
          <h5>Follow Us</h5>
          <a href="https://facebook.com" target="_blank" class="text-white me-3"><i class="bi bi-facebook"></i> Facebook</a><br>
          <a href="https://twitter.com" target="_blank" class="text-white me-3"><i class="bi bi-twitter"></i> Twitter</a><br>
          <a href="https://linkedin.com" target="_blank" class="text-white me-3"><i class="bi bi-linkedin"></i> LinkedIn</a> 
         
        </div>
      </div>
      <div class="row mt-3">
        <!-- Footer bottom -->
        <div class="col-12 text-center">
          <p>&copy; 2025 Your Company. All rights reserved.</p>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap JS, Popper.js, and icons -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.min.js"></script>
</body>
</html>
