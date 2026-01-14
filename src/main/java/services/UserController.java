package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.UserModel;
import utility.DBConnection;




public class UserController {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static boolean insertData(String name, String gmail, String password, String phone, String address){
		
		isSuccess = false;
		
		try {
			
			//DB connection call
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into customers (name, phone, email, address, password)values ('"+name+"', '"+phone+"', '"+gmail+"','"+address+"','"+password+"')";

			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				
				isSuccess = false;
			}
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	// Login validation method
    public static List<UserModel> loginvalidate(String email, String password) throws SQLException, ClassNotFoundException {
    	 
    	List<UserModel> userList = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = DBConnection.getInstance().getConnection(); // Corrected to use getConnection
            statement = connection.createStatement();
            
            // First check the employees table
            String employeeQuery = "SELECT employee_id, name, email, role, contact_number, password FROM online_laundry_management.employees WHERE email = '" + email + "' AND password = '" + password + "'";
            resultSet = statement.executeQuery(employeeQuery);
            
            if (resultSet.next()) {
                UserModel user = new UserModel(
                    resultSet.getInt("employee_id"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("contact_number"),
                    resultSet.getString("role") // Use the existing role column
                );
                userList.add(user);
                return userList;
            }
            
            // If no matching employee found, check customers table
            String customerQuery = "SELECT customer_id, name, email, phone, password, 'customer' as role FROM online_laundry_management.customers WHERE email = '" + email + "' AND password = '" + password + "'";
            resultSet = statement.executeQuery(customerQuery);
            
            if (resultSet.next()) {
                UserModel user = new UserModel(
                    resultSet.getInt("customer_id"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("phone"),
                    resultSet.getString("role")
                );
                userList.add(user);
            }
            
            return userList;
            
        } finally {
            // Close resources
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    
    }
	
	public static List<UserModel> UserProfile(int Id){
		
		
		
		
		ArrayList<UserModel> user = new ArrayList<>();
		
		try {
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			String sql = "select * from employees where employee_id = "+Id+"";
			
			 rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String pass = rs.getString(8);
				
				UserModel u = new UserModel(id, name, email, pass, phone);
				user.add(u);
			}
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public static boolean updateprofile(int id, String name, String gmail, String password, String phone) {
		
		try {
			
			//DB connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			
			String sql = "update employees set name = '"+name+"', email = '"+gmail+"'"
					+ "where employee_id = "+id+"";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				
				isSuccess = false;
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	public static List<UserModel> getById (int Id){
		
	
		
		ArrayList <UserModel> user = new ArrayList<>();
		
		try {
			
			//DB connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//Query
			
			String sql = "select * from employees where employee_id = " + Id;
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String pass = rs.getString(8);
				
				
				UserModel uk = new UserModel(id, name, email , pass, phone);
				user.add(uk);
				
			}
		}catch (Exception e){
			
			e.printStackTrace();
			
		}
		return user;
		
		
		
	}



	public static boolean deleteaccount(int id) {
		
		
		try {
			
			//DB connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			String sql = "delete from employees where employee_id ="+id+"";
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				
				isSuccess = true;
			}else {
				
				isSuccess = false;
			}
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}
		return isSuccess;


}
	public static List<UserModel> getAlldetails(){
		
		
		ArrayList <UserModel> user = new ArrayList<>();
		
		try {
			
			//DB connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//Query
			
			String sql = "select * from employees";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String pass = rs.getString(8);
				
				
				UserModel uk = new UserModel(id, name, email , pass, phone);
				user.add(uk);
				
			}
		}catch (Exception e){
			
			e.printStackTrace();
			
		}
		return user;
		
		}

}