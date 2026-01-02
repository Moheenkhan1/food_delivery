package com.hotel.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hotel.dao.UserDao;
import com.hotel.models.User;
import com.hotel.utils.DbConnection;

public class UserDaoImp implements UserDao {
	
	DbConnection db = new DbConnection(); 
	private Connection connect =  db.connectToDb(); 
	
	private final String  ADD_USER = "INSERT into `user` (username,password,email,phone,address)"
			+ "values( ? , ? , ? , ? , ? )";
	private final String  GET_USER = "SELECT * from `user` where `email`= ? ";
	private final String  GET_ALL_USER = "SELECT * from `user`";
	private final String  DELETE_USER = "DELETE  from `user` where `userId`= ? ";
	private final String  UPDATE_USER = "UPDATE `user`  set `password`= ? , `email`= ? , "
			+ " `phone`= ? , `address` = ? where `userId`= ? ";
	
	

	@Override
	public int addUser(User user) throws SQLException {
		int res=0;
		
			PreparedStatement statement = connect.prepareStatement(ADD_USER);
			
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getEmail()); 
			statement.setLong(4, user.getPhone());
			statement.setString(5, user.getAddress());
			
			res = statement.executeUpdate();
			
			System.out.println(res);
		
		return res;
		
	}

	@Override
	public User getUser(String userEmail) {
		
		User user =null;
		
		try {
			PreparedStatement statement = connect.prepareStatement(GET_USER);
			
			statement.setString(1, userEmail);
			
			ResultSet res = statement.executeQuery();
			
			while(res.next()) {
				int userId = res.getInt("userId");
				String username = res.getString("username");
				String password = res.getString("password");
				String email = res.getString("email");
				Long phone = res.getLong("phone");
				String address = res.getString("address");
				
				
				user = new User(userId,username, password, email, phone, address);
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<User>();
		
		try {
			PreparedStatement statement = connect.prepareStatement(GET_ALL_USER);
			ResultSet res = statement.executeQuery();
			
			while(res.next()) {
				int userId = res.getInt("userId");
				String username = res.getString("username");
				String password = res.getString("password");
				String email = res.getString("email");
				Long phone = res.getLong("phone");
				String address = res.getString("address");
				
				
				User user = new User(userId,username, password, email, phone, address);
				
				userList.add(user);
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return userList;
	}

	@Override
	public void deleteUser(int id) {
		
		try {
			PreparedStatement statement = connect.prepareStatement(DELETE_USER);
			
			statement.setInt(1, id);
			
			int res = statement.executeUpdate();
			
			System.out.println(res);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}

	@Override
	public void updateUser(User user) {
		try {
			PreparedStatement statement = connect.prepareStatement(UPDATE_USER);
			
			statement.setString(1, user.getPassword());
			statement.setString(2, user.getEmail()); 
			statement.setLong(3, user.getPhone());
			statement.setString(4, user.getAddress());
			statement.setInt(5, user.getUserId());
			
			int res = statement.executeUpdate();
			
			System.out.println(res);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}


}
