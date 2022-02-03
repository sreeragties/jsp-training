package net.salarymanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.salarymanagement.model.User;

public class UserDAO {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/employee_jsp?useSSL=false";
	private String jdbcUserName = "root";
	private String jdbcPassword = "sreerag";
	
	private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, salary, department, address, phone) VALUES " +
	        " (?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id, name, salary, department, address, phone from users where id =?";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
	private static final String UPDATE_USERS_SQL = "update users set name = ?,salary= ?, department =?, address =?, phone=? where id = ?;";
	
	protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
	
	public void insertUser(User user) throws SQLException {
		try(Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(INSERT_USERS_SQL)){
			statement.setString(1, user.getName());
			statement.setInt(2, user.getSalary());
			statement.setString(3, user.getDepartment());
			statement.setString(4, user.getAddress());
			statement.setString(5, user.getPhone());
			statement.executeUpdate();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
        	
        	statement.setString(1, user.getName());
			statement.setInt(2, user.getSalary());
			statement.setString(3, user.getDepartment());
			statement.setString(4, user.getAddress());
			statement.setString(5, user.getPhone());
			statement.setInt(6, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
	
	public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            statement.setInt(1, id);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                int salary = rs.getInt("salary");
                String department = rs.getString("department");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                user = new User(id, name, salary, department, address, phone);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user; 
    }
	
	public List<User> selectAllUsers() {
		
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	int id = rs.getInt("id");
            	String name = rs.getString("name");
                int salary = rs.getInt("salary");
                String department = rs.getString("department");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                users.add(new User(id, name, salary, department, address, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users; 
    }
	
	public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
	
	    
	    

