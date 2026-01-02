<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hotel.models.Cart,com.hotel.models.CartItem,java.util.Collection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory - Checkout</title>
    <link rel="stylesheet" href="checkout.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="brand-section">
                <h1 class="brand-name">Savory</h1>
            </div>
            <div class="steps-indicator">
                <div class="step completed">
                    <div class="step-number">1</div>
                    <span class="step-label">Cart</span>
                </div>
                <div class="step-line"></div>
                <div class="step active">
                    <div class="step-number">2</div>
                    <span class="step-label">Checkout</span>
                </div>
                <div class="step-line"></div>
                <div class="step">
                    <div class="step-number">3</div>
                    <span class="step-label">Confirmation</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Checkout Form -->
            <form action="placeOrder" id="checkoutForm">
            <div class="checkout-layout">
                <!-- Left Section - Forms -->
                <div class="forms-section">
                    <!-- Delivery Information -->
                    <div class="form-card">
                        <div class="card-header">
                            <div class="header-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/>
                                    <circle cx="12" cy="10" r="3"/>
                                </svg>
                            </div>
                            <div>
                                <h3 class="card-title">Delivery Information</h3>
                                <p class="card-subtitle">Where should we deliver your order?</p>
                            </div>
                        </div>
                        <div class="checkout-form">
                            <div class="form-group">
                                <label for="name" class="form-label">Full Name</label>
                                <input type="text" id="name" name="name" class="form-input" placeholder="John Doe" required>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="tel" id="phone" name="phone" class="form-input" placeholder="+1 (555) 000-0000" required>
                            </div>
                            <div class="form-group">
                                <label for="flat" class="form-label">Flat/House No., Building Name</label>
                                <input type="text" id="flat" name="flat" class="form-input" placeholder="123, Sunrise Apartments" required>
                            </div>
                            <div class="form-group">
                                <label for="area" class="form-label">Area, Street, Sector</label>
                                <input type="text" id="area" name="area" class="form-input" placeholder="Main Street, Sector 12" required>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="city" class="form-label">City</label>
                                    <input type="text" id="city" name="city" class="form-input" placeholder="New York" required>
                                </div>
                                <div class="form-group">
                                    <label for="pincode" class="form-label">PIN Code</label>
                                    <input type="text" id="pincode" name="pincode" class="form-input" placeholder="10001" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="notes" class="form-label">Delivery Instructions (Optional)</label>
                                <textarea id="notes" name="notes" class="form-textarea" placeholder="e.g., Ring doorbell, leave at door..." rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Method -->
                    <div class="form-card">
                        <div class="card-header">
                            <div class="header-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect width="20" height="14" x="2" y="5" rx="2"/>
                                    <line x1="2" x2="22" y1="10" y2="10"/>
                                </svg>
                            </div>
                            <div>
                                <h3 class="card-title">Payment Method</h3>
                                <p class="card-subtitle">Select your preferred payment option</p>
                            </div>
                        </div>
                        <div class="payment-options">
                            <label class="payment-option">
                                <input type="radio" name="payment" value="card" checked>
                                <div class="option-content">
                                    <div class="option-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect width="20" height="14" x="2" y="5" rx="2"/>
                                            <line x1="2" x2="22" y1="10" y2="10"/>
                                        </svg>
                                    </div>
                                    <div class="option-details">
                                        <span class="option-title">Credit/Debit Card</span>
                                        <span class="option-subtitle">Visa, Mastercard, Amex</span>
                                    </div>
                                </div>
                            </label>
                            <label class="payment-option">
                                <input type="radio" name="payment" value="paypal">
                                <div class="option-content">
                                    <div class="option-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect width="20" height="14" x="2" y="7" rx="2" ry="2"/>
                                            <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/>
                                        </svg>
                                    </div>
                                    <div class="option-details">
                                        <span class="option-title">PayPal</span>
                                        <span class="option-subtitle">Fast & secure</span>
                                    </div>
                                </div>
                            </label>
                            <label class="payment-option">
                                <input type="radio" name="payment" value="cash">
                                <div class="option-content">
                                    <div class="option-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <line x1="12" x2="12" y1="2" y2="22"/>
                                            <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                                        </svg>
                                    </div>
                                    <div class="option-details">
                                        <span class="option-title">Cash on Delivery</span>
                                        <span class="option-subtitle">Pay when you receive</span>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>

                    <!-- Delivery Time -->
                    <div class="form-card">
                        <div class="card-header">
                            <div class="header-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="10"/>
                                    <polyline points="12 6 12 12 16 14"/>
                                </svg>
                            </div>
                            <div>
                                <h3 class="card-title">Delivery Time</h3>
                                <p class="card-subtitle">When would you like to receive your order?</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Section - Order Summary -->
                <div class="summary-section">
                    <div class="summary-card">
                        <h3 class="summary-title">Order Summary</h3>
                        
                        <!-- Order Items -->
                        <div class="order-items">
                            
                            <%
                            	Cart cart=(Cart)session.getAttribute("cart");
                            	Collection<CartItem> items = cart.getAllItems().values();
                            	
                            	for(CartItem item : items){
                            %>
                            <div class="order-item">
                                <div class="item-info">
                                    <span class="item-name"><%=item.getName() %></span>
                                    <span class="item-quantity">× <%=item.getQuantity() %></span>
                                </div>
                                <span class="item-price">₹<%=item.getPrice()*item.getQuantity() %></span>
                            </div>
                            
                            <%		
                            	}
                            %>
               
                        </div>

                        <!-- Price Breakdown -->
                        <div class="price-breakdown">
                            <div class="price-row">
                                <span class="price-label">Subtotal</span>
                                <span class="price-value">₹<%=cart.getTotalPrice() %></span>
                            </div>
                            <div class="price-row">
                                <span class="price-label">Delivery Fee</span>
                                <span class="price-value">FREE</span>
                            </div>
                            <div class="price-row">
                                <span class="price-label">Tax (0%)</span>
                                <span class="price-value">0</span>
                            </div>
                        </div>

                        <!-- Total -->
                        <div class="total-section">
                            <span class="total-label">Total Amount</span>
                            <span class="total-value">₹<%=cart.getTotalPrice() %></span>
                        </div>

                        <!-- Place Order Button -->
                        <button type="submit" class="place-order-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                            </svg>
                            Place Order
                        </button>

                        <!-- Back to Cart -->
                        <a href="cart.jsp" class="back-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="m12 19-7-7 7-7"/>
                                <path d="M19 12H5"/>
                            </svg>
                            Back to Cart
                        </a>
                    </div>

                    <!-- Security Badge -->
                    <div class="security-badge">
                        <svg class="security-icon" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                            <path d="m9 12 2 2 4-4"/>
                        </svg>
                        <div class="security-text">
                            <h4>Secure Checkout</h4>
                            <p>Your information is protected with SSL encryption</p>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="footer-text">© 2026 Savory. All rights reserved. • Secure SSL Checkout</p>
        </div>
    </footer>
</body>
</html>    