package com.hotel.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hotel.daoimp.RestaurantDAOImp;
import com.hotel.models.Restaurant;


@WebServlet("/restaurant")
public class RestaurantsServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			RestaurantDAOImp restaurantDAOImp =new RestaurantDAOImp();
			List<Restaurant> allRestaurants = restaurantDAOImp.getAllRestaurant();
			
			req.setAttribute("allRestaurants", allRestaurants);
			RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
