package com.hotel.models;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> items = new HashMap<>();

	public void addItemToCart(CartItem cartItem) {

		int itemId = cartItem.getItemId();

		if (items.containsKey(itemId)) {

			CartItem item = items.get(itemId);
			item.setQuantity(item.getQuantity() + 1);

		} else {
			items.put(itemId, cartItem);
		}
		
	}

	public void updateCartItem(CartItem cartItem,String method) { 
 
		int itemId = cartItem.getItemId();

		if (items.containsKey(itemId)) {
			CartItem item = items.get(itemId);
			if(method.equals("addition")) {
				int quantity = item.getQuantity();
				item.setQuantity(quantity + 1);	
			}else if(method.equals("sub")) {
				int quantity = item.getQuantity();
				if(quantity>0) {
					item.setQuantity(quantity - 1);		
				}
			}


		}

	}

	public void deleteItem(int itemId) {

		if (items.containsKey(itemId)) {

			items.remove(itemId);

		}

	}
	

	public Collection<CartItem> getItems() {
		return items.values();
	}  
	
	public Map<Integer, CartItem> getAllItems() {
		
		return items;
		
	} 
	
	

	public void setItems(Map<Integer, CartItem> items) {
		this.items = items;
	}
	
	public double getTotalPrice() {
		double totalPrice=0;
		
		for (CartItem item : items.values()) {
			
			totalPrice = totalPrice + ( item.getPrice() * item.getQuantity() );
			
		}
		
		return totalPrice ;
	}
	 
	

}
