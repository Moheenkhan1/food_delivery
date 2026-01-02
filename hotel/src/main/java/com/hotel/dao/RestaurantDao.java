package com.hotel.dao;

import java.util.List;

import com.hotel.models.Restaurant;

public interface RestaurantDao {
	public void addRestaurant(Restaurant restaurant);
	public Restaurant getRestaurant(int id);
	public List<Restaurant> getAllRestaurant();
	public void deleteRestaurant(int id);
	public void updateRestaurant(Restaurant restaurant); 
}
 