package com.hotel.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hotel.daoimp.MenuDaoImp;
import com.hotel.daoimp.RestaurantDAOImp;
import com.hotel.models.Menu;
import com.hotel.models.Restaurant;


@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
			
			RestaurantDAOImp restaurantDAOImp = new RestaurantDAOImp();
			Restaurant restaurant = restaurantDAOImp.getRestaurant(restaurantId);
			
			MenuDaoImp menuDaoImp = new MenuDaoImp();
			List<Menu> menu = menuDaoImp.getMenuByRestaurantById(restaurantId);
			
			req.setAttribute("menu", menu);
			req.setAttribute("restaurant", restaurant);
			
			RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
