package com.hotel.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hotel.dao.RestaurantDao;
import com.hotel.models.Restaurant;
import com.hotel.utils.DbConnection;

public class RestaurantDAOImp implements RestaurantDao {
	
	DbConnection db = new DbConnection();
	private Connection connect =  db.connectToDb(); 
	
	private final String  ADD_RESTAURANT = "INSERT into `restaurant` (name,cuisineType,delivery_time,"
			+ "address,adminUserId,rating,isActive,imagePath) values( ? , ? , ? , ? , ? , ? , ? , ? )";
	private final String  GET_RESTAURANT = "SELECT * from `restaurant` where `restaurantId`= ? ";
	private final String  GET_ALL_RESTAURANTS = "SELECT * from `restaurant`";
	private final String  DELETE_RESTAUANT = "DELETE  from `restaurant` where `restaurantId`= ? ";
	private final String  UPDATE_RESTAUANT = "UPDATE `restaurant`  set `cuisineType`= ? , `delivery_time`= ? , "
			+ " `address`= ? , `rating` = ? , `isActive` = ? , `imagePath`= ? where `restaurantId`= ? ";
	

	@Override
	public void addRestaurant(Restaurant restaurant) {
		try {
			PreparedStatement statement = connect.prepareStatement(ADD_RESTAURANT);
			
			statement.setString(1, restaurant.getName());
			statement.setString(2, restaurant.getCuisineType());
			statement.setString(3, restaurant.getDeliveryTime()); 
			statement.setString(4, restaurant.getAddress());
			statement.setInt(5, restaurant.getAdminUserId());
			statement.setString(6, restaurant.getRating());
			statement.setBoolean(7, restaurant.isActive());
			statement.setString(8, restaurant.getImagePath());
			
			int res = statement.executeUpdate();
			
			System.out.println(res);
			
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Restaurant getRestaurant(int id) {
		
		Restaurant restaurant =null;
		 
		try {
			PreparedStatement statement = connect.prepareStatement(GET_RESTAURANT);
			
			statement.setInt(1, id);
			
			ResultSet res = statement.executeQuery();
			
			while(res.next()) {
				int restaurantId = res.getInt("restaurantId");
				String name = res.getString("name");
				String cuisineType = res.getString("cuisineType");
				String delivery_time = res.getString("delivery_time");
				String address = res.getString("address");
				int adminUserid = res.getInt("adminUserid");
				String rating = res.getString("rating");
				boolean isActive = res.getBoolean("isActive");
				String imagePath = res.getString("imagePath");
				
				
				restaurant =new Restaurant( restaurantId,name, cuisineType, delivery_time, address, adminUserid, rating, isActive, imagePath);
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return restaurant;
	
	}

	@Override
	public List<Restaurant> getAllRestaurant() {
		List<Restaurant> restaurantList =new ArrayList<Restaurant>(); 
		 
		try {
			PreparedStatement statement = connect.prepareStatement(GET_ALL_RESTAURANTS);
			
			ResultSet res = statement.executeQuery();
			
			while(res.next()) {
				int restaurantId = res.getInt("restaurantId");
				String name = res.getString("name");
				String cuisineType = res.getString("cuisineType");
				String delivery_time = res.getString("delivery_time");
				String address = res.getString("address");
				int adminUserid = res.getInt("adminUserid");
				String rating = res.getString("rating");
				boolean isActive = res.getBoolean("isActive");
				String imagePath = res.getString("imagePath");
				
				
				Restaurant restaurant =new Restaurant( restaurantId,name, cuisineType, delivery_time, address, adminUserid, rating, isActive, imagePath);
				restaurantList.add(restaurant);
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return restaurantList;
	}
	
	

	@Override
	public void deleteRestaurant(int id) {
		
		try {
			PreparedStatement statement = connect.prepareStatement(DELETE_RESTAUANT);
			
			statement.setInt(1, id);
			
			int res = statement.executeUpdate();
			
			System.out.println(res);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {  
		try {
			PreparedStatement statement = connect.prepareStatement(UPDATE_RESTAUANT);
			
			statement.setString(1, restaurant.getCuisineType());
			statement.setString(2, restaurant.getDeliveryTime()); 
			statement.setString(3, restaurant.getAddress());
			statement.setString(4, restaurant.getRating());
			statement.setBoolean(5, restaurant.isActive());
			statement.setString(6, restaurant.getImagePath());
			statement.setInt(7, restaurant.getRestaurantId());
			
			int res = statement.executeUpdate();
			
			System.out.println(res);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}

}
