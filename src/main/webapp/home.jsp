<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.hotel.models.Restaurant,com.hotel.models.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Food Delivery Home Page UI</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', sans-serif;
    }
  </style>
</head>
<body class="min-h-screen bg-white">
  <!-- Navigation -->
  <nav class="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
    <div class="max-w-7xl mx-auto px-6 lg:px-8">
      <div class="flex items-center justify-between h-20">
        <div class="flex-shrink-0">
          <h1 class="text-2xl tracking-tight bg-gradient-to-r from-red-600 to-orange-600 bg-clip-text text-transparent font-bold">Savory</h1>
        </div>
        <div class="hidden md:flex items-center gap-8">
          <a href="restaurant" class="text-gray-700 hover:text-red-600 transition-colors font-medium">Home</a>
          <a href="#restaurants" class="text-gray-700 hover:text-red-600 transition-colors font-medium">Restaurants</a>
          <a href="#" class="text-gray-700 hover:text-red-600 transition-colors font-medium">Help</a>
        </div>
        <div class="flex items-center gap-4">
		  <a href="cart" class="relative p-2 hover:bg-orange-50 rounded-full transition-colors group">
		    <svg class="w-6 h-6 text-gray-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
		      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
		    </svg>
		  </a>

		 <%
    User user = (User)session.getAttribute("user");
%>

<% if (user == null) { %>

    <!-- NOT LOGGED IN -->
    <a href="login.jsp" 
       class="px-6 py-2.5 bg-gradient-to-r from-red-600 to-orange-600 text-white rounded-full 
              hover:from-red-700 hover:to-orange-700 transition-all shadow-md font-medium">
        Login
    </a>

<% } else { %>

    <!-- LOGGED IN -->
    <span class="mr-4 font-medium">
        Hi, <%= user.getUsername() %>
    </span>

    <a href="logout" 
       class="px-6 py-2.5 bg-gray-800 text-white rounded-full hover:bg-gray-900 
              transition-all shadow-md font-medium">
        Logout
    </a>

<% } %>

</div>
      </div>
    </div>
  </nav>

  <!-- Hero Section -->
  <section class="relative bg-white overflow-hidden">
    <div class="absolute inset-0 z-0">
      <div class="w-full h-full bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1735233024815-7986206a18a9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxiaXJ5YW5pJTIwZGlzaCUyMGNsb3NldXB8ZW58MXx8fHwxNzY3MjcxNDMzfDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral');"></div>
    </div>
    <div class="relative z-10 max-w-4xl mx-auto px-6 py-16 lg:py-24 text-center">
      <h1 class="text-5xl lg:text-6xl mb-10 text-white tracking-tight max-w-3xl mx-auto drop-shadow-lg font-bold">Find the best restaurants in your area</h1>
      <div class="max-w-2xl mx-auto mb-8">
        <div class="relative">
          <svg class="absolute left-6 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
          </svg>
          <input type="text" placeholder="Search for restaurants or cuisines…" class="w-full pl-14 pr-6 py-5 bg-white rounded-full border-2 border-transparent shadow-xl focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-transparent transition-all">
        </div>
      </div>
      <div class="flex items-center justify-center gap-3 flex-wrap" id="categories">
		  <button class="flex items-center gap-2 px-5 py-2.5 bg-white rounded-full border-2 border-white hover:border-red-500 hover:bg-red-50 hover:shadow-lg transition-all text-stone-700 font-medium shadow-sm">
		    <span class="text-lg">🍕</span>
		    <span class="text-sm">Pizza</span>
		  </button>
		
		  <button class="flex items-center gap-2 px-5 py-2.5 bg-white rounded-full border-2 border-white hover:border-red-500 hover:bg-red-50 hover:shadow-lg transition-all text-stone-700 font-medium shadow-sm">
		    <span class="text-lg">🍔</span>
		    <span class="text-sm">Burgers</span>
		  </button>
		
		  <button class="flex items-center gap-2 px-5 py-2.5 bg-white rounded-full border-2 border-white hover:border-red-500 hover:bg-red-50 hover:shadow-lg transition-all text-stone-700 font-medium shadow-sm">
		    <span class="text-lg">🍜</span>
		    <span class="text-sm">Asian</span>
		  </button>
		
		  <button class="flex items-center gap-2 px-5 py-2.5 bg-white rounded-full border-2 border-white hover:border-red-500 hover:bg-red-50 hover:shadow-lg transition-all text-stone-700 font-medium shadow-sm">
		    <span class="text-lg">🍰</span>
		    <span class="text-sm">Desserts</span>
		  </button>
		
		  <button class="flex items-center gap-2 px-5 py-2.5 bg-white rounded-full border-2 border-white hover:border-red-500 hover:bg-red-50 hover:shadow-lg transition-all text-stone-700 font-medium shadow-sm">
		    <span class="text-lg">🍝</span>
		    <span class="text-sm">Italian</span>
		  </button>
		
		  <button class="flex items-center gap-2 px-5 py-2.5 bg-white rounded-full border-2 border-white hover:border-red-500 hover:bg-red-50 hover:shadow-lg transition-all text-stone-700 font-medium shadow-sm">
		    <span class="text-lg">🥗</span>
		    <span class="text-sm">Healthy</span>
		  </button>
      </div>
    </div>
  </section>

  <!-- Quote Card -->
  <section class="bg-gradient-to-b from-orange-50 to-white py-12">
    <div class="max-w-4xl mx-auto px-6">
      <div class="relative bg-white rounded-2xl p-8 lg:p-10 text-center border border-orange-200 shadow-md">
        <div class="flex justify-center mb-4">
          <div class="p-2 bg-gradient-to-br from-red-500 to-orange-500 rounded-full shadow-sm">
            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path>
            </svg>
          </div>
        </div>
        <blockquote class="text-xl lg:text-2xl text-stone-700 mb-4 leading-relaxed max-w-2xl mx-auto italic">“Food is symbolic of love when words are inadequate.”</blockquote>
        <p class="text-stone-500 text-sm">— Alan D. Wolfelt</p>
      </div>
    </div>
  </section>

  <!-- Popular Restaurants -->
  <section class="bg-gray-50 py-16 lg:py-20">
    <div class="max-w-7xl mx-auto px-6 lg:px-8">
      <div class="flex items-center justify-between mb-10">
        <div>
          <h2 class="text-3xl lg:text-4xl text-gray-800 mb-2 font-bold">Popular Restaurants</h2>
          <p class="text-gray-600">Discover the most loved places near you</p>
        </div>
       </div>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6" id="restaurants">
      		
      		<%
      		
      			List<Restaurant> restaurants= (List<Restaurant>) request.getAttribute("allRestaurants");
      		
      			for(Restaurant restaurant:restaurants){
      		%>
      		
      		
      		<a href="menu?restaurantId=<%=restaurant.getRestaurantId() %>" >
	      	<div class="max-w-sm bg-white rounded-xl shadow-lg overflow-hidden group border border-gray-100">
				  <div class="relative h-64 overflow-hidden bg-gray-100">
				    <img 
				      src="<%= restaurant.getImagePath() %>" 
				      alt="<%=restaurant.getName() %>" 
				      class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
				    >
				  </div>
	
				  <div class="p-6">
				    <h3 class="text-xl mb-2 text-gray-800 font-semibold"><%=restaurant.getName() %></h3>
				    <p class="text-gray-500 mb-4 text-sm"><%=restaurant.getCuisineType() %></p>
				    
				    <div class="flex items-center justify-between pt-4 border-t border-gray-100">
				      <div class="flex items-center gap-1.5 bg-green-600 text-white px-2 py-1 rounded-lg">
				        <svg class="w-3.5 h-3.5 fill-white" viewBox="0 0 24 24">
				          <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
				        </svg>
				        <span class="text-sm font-semibold"><%=restaurant.getRating() %></span>
				      </div>
				
				      <div class="flex items-center gap-1.5 text-gray-600">
				        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
				          <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
				        </svg>
				        <span class="text-sm font-medium"><%=restaurant.getDeliveryTime() %> min</span>
				      </div>
				
				      <div class="flex items-center text-orange-500 font-bold">
				        <span>$$</span><span class="text-gray-300">$</span>
				      </div>
				    </div>
				  </div>
			</div>
			</a>
			<%		
      			}
      		
      		%>
			
			
      		
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-white border-t border-gray-200">
    <div class="max-w-7xl mx-auto px-6 lg:px-8 py-12">
      <div class="flex flex-col md:flex-row items-center justify-between gap-6">
        <p class="text-gray-600 text-sm">© 2026 Savory. All rights reserved.</p>
        <div class="flex items-center gap-8">
          <a href="#" class="text-gray-600 hover:text-red-600 text-sm transition-colors font-medium">Privacy Policy</a>
          <a href="#" class="text-gray-600 hover:text-red-600 text-sm transition-colors font-medium">Terms of Service</a>
          <a href="#" class="text-gray-600 hover:text-red-600 text-sm transition-colors font-medium">Contact Us</a>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>    