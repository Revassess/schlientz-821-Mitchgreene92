package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserRepository implements CrudRepository{
	
	//problem 1
	private static ConnectionUtil cu = ConnectionUtil.getInstance();
	private static Connection connection = cu.connect();
	
	//problem 4 - ran out of time after writing first implementation
	public User save(Object u) {
		User user = (User u);
		
		try {
			
			String sql = "INSERT INTO app_user VALUES(?,?,?,?,?,?);"
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ps.setString(1, Integer.toString(user.getUsername()));
			ps.setString(2,  user.getUsername());
			ps.setString(3,  user.getPassword());
			ps.setString(4,  user.getFirstName());
			ps.setString(5,  user.getLastName());
			ps.setString(6,  Integer.toString(user.getRole()));
			
			ps.executeQuery();
			
			return user;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}