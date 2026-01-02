package com.hotel.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	
	private final String URL="jdbc:mysql://localhost:3306/food_delivery";
	private final String USERNAME="root";
	private final String PASSWORD="Mohin786";
	private Connection connection;
	
	
	public Connection connectToDb() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			System.out.println("Db Connected Successfully");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}

}
