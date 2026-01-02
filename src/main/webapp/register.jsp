<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory - Create Account</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <div class="container">
        <div class="content-wrapper">
            <!-- Brand Header -->
            <div class="brand-header">
                <h1 class="brand-name">Savory</h1>
            </div>

            <!-- Register Card -->
            <div class="register-card">
                <!-- Card Header -->
                <div class="card-header">
                    <h2 class="card-title">Create Account</h2>
                    <p class="card-subtitle">Join us and start ordering delicious food today</p>
                </div>
                
                <%
String error = request.getParameter("error");
String userExists = (String) request.getAttribute("userExists");
%>

<div style="max-width:600px;margin:10px auto;">
    <% if ("phone_exists".equals(error)) { %>
        <div style="padding:12px;border-radius:6px;background:#ffe6e6;color:#a30000;margin-bottom:8px;">
            Phone number is already registered.
        </div>
    <% } else if ("username_exists".equals(error)) { %>
        <div style="padding:12px;border-radius:6px;background:#ffe6e6;color:#a30000;margin-bottom:8px;">
            Username is already taken. Please choose another.
        </div>
    <% } else if ("userExists".equals(userExists)) { %>
        <div style="padding:12px;border-radius:6px;background:#ffe6e6;color:#a30000;margin-bottom:8px;">
            An account already exists with this email.
        </div>
    <% } %>
</div>
                

                <!-- Register Form -->
                <form id="registerForm" action="register" method="POST" class="register-form">
                    <!-- Username Field -->
                    <div class="form-group">
                        <label for="username" class="form-label">Username</label>
                        <div class="input-wrapper">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                                <circle cx="12" cy="7" r="4"/>
                            </svg>
                            <input
                                type="text"
                                id="username"
                                name="username"
                                class="form-input"
                                placeholder="johndoe"
                                required
                                minlength="3"
                            />
                        </div>
                    </div>

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
                                id="email"
                                name="email"
                                class="form-input"
                                placeholder="you@example.com"
                                required
                            />
                        </div>
                    </div>

                    <!-- Phone Field -->
                    <div class="form-group">
                        <label for="phone" class="form-label">Phone Number</label>
                        <div class="input-wrapper">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                            </svg>
                            <input
                                type="number"
                                id="phone"
                                name="phone"
                                class="form-input"
                                placeholder="+91 1234567890"
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
                                id="password"
                                name="password"
                                class="form-input"
                                placeholder="••••••••"
                                required
                                minlength="8"
                            />
                        </div>
                        <p class="helper-text">Must be at least 8 characters</p>
                    </div>

                    <!-- Confirm Password Field -->
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <div class="input-wrapper">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                            </svg>
                            <input
                                type="password"
                                id="confirmPassword"
                                name="confirmPass"
                                class="form-input"
                                placeholder="••••••••"
                                required
                                minlength="8"
                            />
                        </div>
                    </div>

                    <!-- Register Button -->
                    <button type="submit" class="register-button">
                        Create Account
                    </button>
                </form>

                <!-- Login Link -->
                <div class="login-wrapper">
                    <p class="login-text">
                        Already have an account? 
                        <a href="login.jsp" class="login-link">Login</a>
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="footer-text">
                <p>Secure registration • Your data is protected</p>
            </div>
        </div>
    </div>

    <script >
    
    
    
 // Get form element
    const registerForm = document.getElementById('registerForm');

    // Get input elements
    const usernameInput = document.getElementById('username');
    const emailInput = document.getElementById('email');
    const phoneInput = document.getElementById('phone');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const termsCheckbox = document.getElementById('terms');

    // Validation functions
    function validateUsername(username) {
        return username.length >= 3;
    }

    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function validatePhone(phone) {
        return phone.length >= 10 && phone.length <= 15;
    }

    function validatePassword(password) {
        return password.length >= 8;
    }

    function validatePasswordMatch(password, confirmPassword) {
        return password === confirmPassword;
    }

    // Show error message
    function showError(input, message) {
        input.classList.add('error');
        input.classList.remove('success');
        
        // Remove existing error message if any
        const existingError = input.parentElement.parentElement.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
        
        // Add new error message
        const errorElement = document.createElement('p');
        errorElement.className = 'error-message';
        errorElement.textContent = message;
        input.parentElement.parentElement.appendChild(errorElement);
    }

    // Show success
    function showSuccess(input) {
        input.classList.remove('error');
        input.classList.add('success');
        
        // Remove error message if any
        const existingError = input.parentElement.parentElement.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
    }

    // Clear validation state
    function clearValidation(input) {
        input.classList.remove('error', 'success');
        const existingError = input.parentElement.parentElement.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
    }

    // Real-time validation
    usernameInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            clearValidation(this);
        } else if (!validateUsername(this.value)) {
            showError(this, 'Username must be at least 3 characters');
        } else {
            showSuccess(this);
        }
    });

    emailInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            clearValidation(this);
        } else if (!validateEmail(this.value)) {
            showError(this, 'Please enter a valid email address');
        } else {
            showSuccess(this);
        }
    });

    phoneInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            clearValidation(this);
        } else if (!validatePhone(this.value)) {
            showError(this, 'Please enter a valid phone number');
        } else {
            showSuccess(this);
        }
    });

    passwordInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            clearValidation(this);
        } else if (!validatePassword(this.value)) {
            showError(this, 'Password must be at least 8 characters');
        } else {
            showSuccess(this);
        }
    });

    confirmPasswordInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            clearValidation(this);
        } else if (!validatePasswordMatch(passwordInput.value, this.value)) {
            showError(this, 'Passwords do not match');
        } else {
            showSuccess(this);
        }
    });

   

    

    // Add smooth focus animations
    const inputs = document.querySelectorAll('.form-input');

    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    });

    // Handle terms link
    document.querySelector('.terms-link').addEventListener('click', function(e) {
        e.preventDefault();
        alert('Terms & Conditions page would open here!');
        // In a real app, open terms page in a modal or new window
    });

    // Password strength indicator (optional enhancement)
    passwordInput.addEventListener('input', function() {
        const password = this.value;
        let strength = 0;
        
        if (password.length >= 8) strength++;
        if (password.match(/[a-z]+/)) strength++;
        if (password.match(/[A-Z]+/)) strength++;
        if (password.match(/[0-9]+/)) strength++;
        if (password.match(/[$@#&!]+/)) strength++;
        
        // You can add a visual strength indicator here
        // For now, just console log
        if (password.length > 0) {
            const strengthText = ['Very Weak', 'Weak', 'Fair', 'Good', 'Strong'];
            console.log('Password strength:', strengthText[strength - 1] || 'Very Weak');
        }
    });

    
    
    
    
    </script>
</body>
</html>
    