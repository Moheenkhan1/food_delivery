<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.hotel.models.Menu,com.hotel.models.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory - Restaurant Menu</title>
    <link rel="stylesheet" href="menu.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="brand-section">
                <h1 class="brand-name">Savory</h1>
            </div>
            <div class="cart-section">
                <button class="cart-button" id="cartButton">
                    <svg class="cart-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="8" cy="21" r="1"/>
                        <circle cx="19" cy="21" r="1"/>
                        <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/>
                    </svg>
                    <span class="cart-count" id="cartCount">0</span>
                </button>
            </div>
        </div>
    </header>

    <!-- Restaurant Info Section -->
    <section class="restaurant-info">
        <div class="container">
            <div class="info-content">
                <div class="info-text">
                <%
                   Restaurant restaurant=(Restaurant)request.getAttribute("restaurant");
                %>
                    <h2 class="restaurant-name"><%=restaurant.getName() %></h2>
                    <p class="restaurant-description">
                        <%=restaurant.getCuisineType() %>
                    </p>
                    <div class="restaurant-details">
                        <div class="detail-item">
                            <svg class="detail-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"/>
                                <polyline points="12 6 12 12 16 14"/>
                            </svg>
                            <span><%=restaurant.getDeliveryTime()%> min</span>
                        </div>
                        <div class="detail-item">
                            <svg class="detail-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                            </svg>
                            <span><%=restaurant.getRating() %> (500+ ratings)</span>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Category Filter -->
    <section class="category-filter">
        <div class="container">
            <div class="filter-buttons">
                <button class="filter-btn active" data-category="all">All Items</button>
                <button class="filter-btn" data-category="appetizers">Appetizers</button>
                <button class="filter-btn" data-category="mains">Main Course</button>
                <button class="filter-btn" data-category="desserts">Desserts</button>
                <button class="filter-btn" data-category="drinks">Drinks</button>
            </div>
        </div>
    </section>

    <!-- Menu Items Section -->
    <section class="menu-section">
        <div class="container">
            <!-- Appetizers -->
            <div class="menu-category" data-category="appetizers">
                <h3 class="category-title">All Items</h3>
                <div class="menu-grid">
                
                
                <%
    List<Menu> items = (List<Menu>) request.getAttribute("menu");
    for (Menu item : items) {
%>

<form action="cart">
    
    <div class="menu-item" data-item-id="<%=item.getMenuId()%>">

        <div class="item-image">
            <img src="<%=item.getImagePath()%>" alt="<%=item.getItemName()%>">
        </div>

        <div class="item-content">

            <div class="item-header">
                <h4 class="item-name"><%=item.getItemName()%></h4>
                <span class="item-price">₹<%=item.getPrice()%></span>
            </div>

            <p class="item-description"><%=item.getDescription()%></p>

            <!-- Hidden fields sent to backend -->
            <input type="hidden" name="itemId" value="<%=item.getMenuId()%>">
            <input type="hidden" name="itemName" value="<%=item.getItemName()%>">
            <input type="hidden" name="price" value="<%=item.getPrice()%>">
            <input type="hidden" name="quantity" value="1">
            <input type="hidden" name="restaurantId" value="<%=item.getRestaurantId()%>">
            <input type="hidden" name="action" value="add">

            <button type="submit" class="add-to-cart-btn">
                Add to Cart
            </button>

        </div>

    </div>

</form>

<%
    }
%>

                
                
                    

                    

                    
                </div>
            </div>

            
        </div>
    </section>


    <script>
    



    // Add animation on scroll (optional enhancement)
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animation = 'fadeInUp 0.6s ease forwards';
            }
        });
    }, observerOptions);

    // Add fade-in animation styles
    const animationStyle = document.createElement('style');
    animationStyle.textContent = `
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .menu-item {
            opacity: 0;
        }
    `;
    document.head.appendChild(animationStyle);

    // Observe all menu items
    document.querySelectorAll('.menu-item').forEach(item => {
        observer.observe(item);
    });    
    
    </script>
</body>
</html>
    