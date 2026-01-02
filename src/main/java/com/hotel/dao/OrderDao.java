package com.hotel.dao;

import java.util.List;

import com.hotel.models.Order;

public interface OrderDao {
	public int addOrder(Order order);
	public Order getOrder(int id);
	public List<Order> getAllOrders();
	public void deleteOrder(int id);
	public Order updateOrder(int id);
}
  