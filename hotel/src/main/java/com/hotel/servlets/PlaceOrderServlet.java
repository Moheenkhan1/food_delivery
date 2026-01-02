package com.hotel.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.hotel.daoimp.OrderDaoImp;
import com.hotel.daoimp.OrderItemDaoImp;
import com.hotel.models.Cart;
import com.hotel.models.CartItem;
import com.hotel.models.Order;
import com.hotel.models.OrderItem;
import com.hotel.models.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
	
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		
		if(user==null) {
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		
		if(cart!=null && !cart.getAllItems().values().isEmpty()) {
		
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String flat = req.getParameter("flat");
		String area = req.getParameter("area");
		String city = req.getParameter("city");
		String pincode = req.getParameter("pincode");
		 
		int userId = user.getUserId();
		int oldRestaurantId = (Integer)session.getAttribute("oldRestaurantId");
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		double totalPrice = cart.getTotalPrice();
		String status="Order Confrimed";
		String payment = req.getParameter("payment");
		String address= name+phone+flat+area+city+pincode ;
		
		Order order = new Order(userId, oldRestaurantId, currentTimestamp, totalPrice, status, payment, address);
		
		OrderDaoImp orderDaoImp = new OrderDaoImp();
		int orderId = orderDaoImp.addOrder(order);
		double totalPrice2 = cart.getTotalPrice();
		
		
		for (CartItem cartItems : cart.getAllItems().values()) {
			int itemId = cartItems.getItemId();
			OrderItem orderItem = new OrderItem(orderId, itemId, totalPrice2);
			
			OrderItemDaoImp orderItemDaoImp = new OrderItemDaoImp();
			orderItemDaoImp.addOrderItem(orderItem);
			
		}
		
		session.removeAttribute("cart");
		session.removeAttribute("oldRestaurantId");
		
		resp.sendRedirect("thankyou.html");
		
		}else {
			resp.sendRedirect("restaurant");
		}
		
		
		
	}

	
}
