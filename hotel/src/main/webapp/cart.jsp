<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hotel.models.Cart,java.util.Collection , com.hotel.models.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory - Shopping Cart</title>
    <link rel="stylesheet" href="cart.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="brand-section">
                <h1 class="brand-name">Savory</h1>
            </div>
            <nav class="nav-links">
                <a href="restaurant" class="nav-link">Back to Menu</a>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Page Title -->
            <div class="page-header">
                <h2 class="page-title">Shopping Cart</h2>
                <p class="page-subtitle">Review your order before checkout</p>
            </div>

            <div class="cart-layout">
                <!-- Cart Items Section -->
                <div class="cart-section">
                    <!-- Cart Items Container -->
                    <div class="cart-items-container flex" id="cartItemsContainer">
                    
                    
                    <%
                    	Cart cart = (Cart)session.getAttribute("cart");
                    	Integer restaurantId = (Integer)session.getAttribute("oldRestaurantId");
                    	Collection<CartItem>  items=cart.getAllItems().values();
                    	
                    	for( CartItem item:items){
                    %>
                    
                    		
                    
                    
                    
                       <div class="cart-item" style="animation-delay: 1s">
                <div class="item-image-wrapper">
                    <img src="<%=item.getImagePath() %>" 
                         alt="<%=item.getName() %>" 
                         class="item-image"
                         loading="lazy">
                </div>
                <div class="item-details">
                    <h4 class="item-name"><%=item.getName() %></h4>
                    <p class="item-description"><%=item.getDescription() %></p>
                    <div class="item-price"><%=item.getPrice() %>₹</div>
                </div>
                <form action="cart" class="item-actions">

    <!-- identifies the operation -->
    <input type="hidden" name="action" value="update">

    <!-- identifies the cart item -->
    <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">

    <!-- current quantity -->
    <input type="hidden" name="quantity" value="<%=item.getQuantity()%>">

    <div class="quantity-controls">

        <!-- Decrease -->
        <button type="submit" name="incdec" value="sub" class="quantity-btn decrease-btn">−</button>

        <span class="quantity"><%=item.getQuantity()%></span>

        <!-- Increase -->
        <button type="submit" name="incdec" value="addition" class="quantity-btn increase-btn">+</button>
    </div>


    <!-- Remove button -->
    <button type="submit" name="incdec" value="remove" class="remove-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
             viewBox="0 0 24 24" fill="none" stroke="currentColor"
             stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M3 6h18"/>
            <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/>
            <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/>
        </svg>
        Remove
    </button>

    <div class="item-total">
        Total: ₹<%=item.getPrice()*item.getQuantity()%>
    </div>

</form>

            </div>
            
            <% 		
                    	}
                    
                    %>
            
            
                    </div>

                    <% if (cart == null) { %>

<div class="empty-cart" id="emptyCart">
    <svg class="empty-cart-icon" xmlns="http://www.w3.org/2000/svg" width="80" height="80" 
         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" 
         stroke-linecap="round" stroke-linejoin="round">
        <circle cx="8" cy="21" r="1"/>
        <circle cx="19" cy="21" r="1"/>
        <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/>
    </svg>

    <h3 class="empty-cart-title">Your cart is empty</h3>
    <p class="empty-cart-text">Add some delicious items to get started!</p>
    <a href="menu.html" class="continue-shopping-btn">Browse Menu</a>
</div>

<% } %>
   
                    

                <!-- Order Summary Section -->
                <div class="summary-section">
                    <div class="summary-card">
                        <h3 class="summary-title">Order Summary</h3>
                        
                        <!-- Order Details -->
                        <div class="summary-details">
                            <div class="summary-row">
                                <span class="summary-label">Items (<span id="itemCount"><%=items.size() %></span>)</span>
                                <span class="summary-value" id="subtotal">₹<%=cart.getTotalPrice() %></span>
                            </div>
                            <div class="summary-row">
                                <span class="summary-label">Delivery Fee</span>
                                <span class="summary-value" id="deliveryFee">₹0.00</span>
                            </div>
                            <div class="summary-row">
                                <span class="summary-label">Tax (0%)</span>
                                <span class="summary-value" id="tax">₹0.00</span>
                            </div>
                            <div class="summary-row discount-row" id="discountRow" style="display: none;">
                                <span class="summary-label">Discount</span>
                                <span class="summary-value discount-value" id="discount">-₹<%=cart.getTotalPrice() %></span>
                            </div>
                        </div>


                        <!-- Total -->
                        <div class="summary-total">
                            <span class="total-label">Total</span>
                            <span class="total-value" id="totalAmount">₹<%=cart.getTotalPrice() %></span>
                        </div>

                        <!-- Checkout Button -->
                        <a class="checkout-btn" id="checkoutBtn" href="checkout.jsp" >
                            Proceed to Checkout
                        </a>

                        <!-- Continue Shopping -->
                        <a href="menu?restaurantId=<%=restaurantId %>" class="continue-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="m12 19-7-7 7-7"/>
                                <path d="M19 12H5"/>
                            </svg>
                            Continue Shopping
                        </a>
                    </div>

                    <!-- Trust Badges -->
                    <div class="trust-badges">
                        <div class="trust-item">
                            <svg class="trust-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect width="20" height="16" x="2" y="4" rx="2"/>
                                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                            </svg>
                            <span>Secure Checkout</span>
                        </div>
                        <div class="trust-item">
                            <svg class="trust-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                            </svg>
                            <span>Safe & Protected</span>
                        </div>
                        <div class="trust-item">
                            <svg class="trust-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 11V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h6"/>
                                <path d="m12 12 4 10 1.7-4.3L22 16Z"/>
                            </svg>
                            <span>Fast Delivery</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="footer-text">© 2026 Savory. All rights reserved.</p>
        </div>
    </footer>

    <script>
    
    
 
    



    
    

    





  

   

 

    
    
    
    </script>
</body>
</html>
    