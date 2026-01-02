<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory - Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="container">
        <div class="content-wrapper">
            <!-- Brand Header -->
            <div class="brand-header">
                <h1 class="brand-name">Savory</h1>
            </div>

            <!-- Login Card -->
            <div class="login-card">
                <!-- Card Header -->
                <div class="card-header">
                    <h2 class="card-title">Welcome Back</h2>
                    <p class="card-subtitle">Login to continue ordering delicious food</p>
                </div>
                <%
				    String valid = (String) request.getAttribute("validation");

    				if ("invalid".equals(valid)) { 
				%>
   					 <div style="padding:12px;border-radius:6px;background:#ffe6e6;color:#a30000;margin-bottom:8px;">
            Invalid Credentials.
        </div>
				<% 
				    }  
				%>
                

                <!-- Login Form -->
                <form id="loginForm" action="loginServlet" method="POST" class="login-form">
                    <!-- Email Field -->
                    <div class="form-group">
                        <label for="email" class="form-label">Email Address</label>
                        <div class="input-wrapper">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect width="20" height="16" x="2" y="4" rx="2"/>
                                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                            </svg>
                            <input
                                type="email"
                                name="email"
                                id="email"
                                class="form-input"
                                placeholder="you@example.com"
                                required
                            />
                        </div>
                    </div>

                    <!-- Password Field -->
                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-wrapper">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                            </svg>
                            <input
                                type="password"
                                name="password"
                                id="password"
                                class="form-input"
                                placeholder="••••••••"
                                required
                            />
                        </div>
                    </div>

                    <!-- Login Button -->
                    <button type="submit" class="login-button">
                        Login
                    </button>
                </form>

                <!-- Sign Up Link -->
                <div class="signup-wrapper">
                    <p class="signup-text">
                        Don't have an account? 
                        <a href="register.jsp" class="signup-link">Sign Up</a>
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="footer-text">
                <p>Secure login • Protected by encryption</p>
            </div>
        </div>
    </div>

    <script>
	    const inputs = document.querySelectorAll('.form-input');
	
	    inputs.forEach(input => {
	        input.addEventListener('focus', function() {
	            this.parentElement.classList.add('focused');
	        });
	        
	        input.addEventListener('blur', function() {
	            this.parentElement.classList.remove('focused');
	        });
	    });
    </script>
</body>
</html>
    