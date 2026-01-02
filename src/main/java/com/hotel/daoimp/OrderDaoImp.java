package com.hotel.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hotel.dao.OrderDao;
import com.hotel.models.Order;
import com.hotel.utils.DbConnection;

public class OrderDaoImp implements OrderDao {
	
	DbConnection db = new DbConnection();
	private Connection connect = db.connectToDb(); 
	
	private final String ADD_ORDER =
	    "INSERT INTO `order` (userId, restaurantId, orderDate, totalAmount, status, paymentMode) "
	  + "VALUES (?, ?, ?, ?, ?, ?)";

	private final String GET_ORDER =
	    "SELECT * FROM `order` WHERE orderId = ?";

	private final String GET_ALL_ORDERS =
	    "SELECT * FROM `order`";

	private final String DELETE_ORDER =
	    "DELETE FROM `order` WHERE orderId = ?";

	private final String UPDATE_ORDER =
	    "UPDATE `order` SET userId=?, restaurantId=?, orderDate=?, totalAmount=?, status=?, paymentMode=? "
	  + "WHERE orderId=?";



	@Override
	public int addOrder(Order order) {
	    
	    int generatedId = -1;

	    try (PreparedStatement ps = connect.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS)) {
	        
	        ps.setInt(1, order.getUserId());
	        ps.setInt(2, order.getRestaurantId());
	        ps.setTimestamp(3, order.getOrderDate());
	        ps.setDouble(4, order.getTotalAmount());
	        ps.setString(5, order.getStatus());
	        ps.setString(6, order.getPaymentMode());

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            generatedId = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }

	    return generatedId;
	}




	@Override
	public Order getOrder(int id) {
		
		Order order = null;
		
		try (PreparedStatement ps = connect.prepareStatement(GET_ORDER)) {
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				order = new Order();
				
				order.setOrderId(rs.getInt("orderId"));
				order.setUserId(rs.getInt("userId"));
				order.setRestaurantId(rs.getInt("restaurantId"));
				order.setOrderDate(rs.getTimestamp("orderDate"));
				order.setTotalAmount(rs.getDouble("totalAmount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMode(rs.getString("paymentMode"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return order;
	}



	@Override
	public List<Order> getAllOrders() {
		
		List<Order> list = new ArrayList<>();
		
		try (PreparedStatement ps = connect.prepareStatement(GET_ALL_ORDERS);
			 ResultSet rs = ps.executeQuery()) {
			
			while (rs.next()) {
				
				Order order = new Order();
				
				order.setOrderId(rs.getInt("orderId"));
				order.setUserId(rs.getInt("userId"));
				order.setRestaurantId(rs.getInt("restaurantId"));
				order.setOrderDate(rs.getTimestamp("orderDate"));
				order.setTotalAmount(rs.getInt("totalAmount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMode(rs.getString("paymentMode"));
				
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public void deleteOrder(int id) {
		
		try (PreparedStatement ps = connect.prepareStatement(DELETE_ORDER)) {
			
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	@Override
	public Order updateOrder(int id) {
		return getOrder(id);
	}

}
