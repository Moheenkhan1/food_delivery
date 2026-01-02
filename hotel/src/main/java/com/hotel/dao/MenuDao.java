package com.hotel.dao;

import java.util.List;

import com.hotel.models.Menu;

public interface MenuDao {

	public void addMenu(Menu menu);

	public Menu getMenu(int id);

	public List<Menu> getAllMenu();

	public void deleteMenu(int id);

	public Menu updateMenu(int id);
	
	public List<Menu> getMenuByRestaurantById(int id);


}
