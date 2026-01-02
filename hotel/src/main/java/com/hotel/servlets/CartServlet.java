package com.hotel.servlets;

import java.io.IOException;
import java.util.Map;

import com.hotel.daoimp.MenuDaoImp;
import com.hotel.models.Cart;
import com.hotel.models.CartItem;
import com.hotel.models.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Cart cart = (Cart)session.getAttribute("cart");
		Integer oldRestaurantId = (Integer)session.getAttribute("oldRestaurantId");
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		if(cart==null || oldRestaurantId!=restaurantId) {
			cart = new Cart();
			
			session.setAttribute("cart", cart);
			session.setAttribute("oldRestaurantId", restaurantId);
			
		}
		
		String action = req.getParameter("action");
		
		if( action.equals("add")) {
			addItemToCart(req,cart);
		}else if( action.equals("update") ) {
			updateCartItem(req,cart);
		}else if( action.equals("remove") ) {
			deleteCartItem(req,cart);
		}
		
		resp.sendRedirect("cart.jsp");
		
	}
	
	
	private void addItemToCart(HttpServletRequest req, Cart cart) {
		
		try {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		MenuDaoImp menuDaoImp = new MenuDaoImp();
		Menu menu = menuDaoImp.getMenu(itemId);
		
		String itemName = menu.getItemName();
		int price = menu.getPrice();
		String description = menu.getDescription();
		String imagePath = menu.getImagePath();
		
		
		CartItem cartItem = new CartItem(itemId, restaurantId, quantity, itemName, price,description,imagePath);
		
		cart.addItemToCart(cartItem);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	private void updateCartItem(HttpServletRequest req, Cart cart ) {
		
		try {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		String incdec = req.getParameter("incdec");
		
		Map<Integer, CartItem> items = cart.getAllItems();
		CartItem cartItem = items.get(itemId);
		
		cart.updateCartItem(cartItem,incdec);
		
		if(cartItem.getQuantity()==0) {
			cart.deleteItem(cartItem.getItemId());
		}
		
		
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
	}

	private void deleteCartItem(HttpServletRequest req, Cart cart) {
		
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		
		cart.deleteItem(itemId);
		
	}
	
}
