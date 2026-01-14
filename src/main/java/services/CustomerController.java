package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.CustomerModel;
import utility.DBConnection;

public class CustomerController {
	
	//DB Connection
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Insert Data Function
	
	public static boolean insertData(String name, String phone,  String email, String address, String password){
		
		isSuccess = false;
		try {
			
			//DB Connection call
			
			con  = DBConnection.getInstance().getConnection();

			stmt = con.createStatement();
			
			String sql = "INSERT INTO customers (name, phone, email, address, password) " +
		             "VALUES ('" + name + "', '" + phone + "', '" + email + "', '" + address + "', '" + password + "')";
		
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				
				isSuccess= true;
			}else {
				
				isSuccess = false;
			}
		
		}catch(Exception ex) {
			
			ex.printStackTrace();
		}
		
		return isSuccess;
		
	}

	

	public static List<CustomerModel> getAllCustomers(){
		
		ArrayList<CustomerModel> customers = new ArrayList<>();
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			
			//Query
			
			String sql = "select * from customers";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int customer_id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String email = rs.getString(4);
				String address = rs.getString(5);
				String created_at = rs.getString(6);
				String password = rs.getString(7);
				
				CustomerModel cm = new CustomerModel(customer_id, name, phone, email, address,  created_at, password);
				customers.add(cm);
				
			}
				
				
			}catch(Exception ex) {
				
				ex.printStackTrace();
			}
		
		return customers;
	}


	public static boolean updatedata(int customer_id, String name, String phone, String email, String address, String password) {
	    isSuccess = false;
	
	    try {
	        con = DBConnection.getInstance().getConnection();
	        stmt = con.createStatement();
	
	        String sql = "UPDATE customers SET customer_id = '" + customer_id + "', " +
	                     "name = '" + name + "', " +
	                     "phone = '" + phone + "', " +
	                     "email = '" + email + "', " +
	                     "address = '" + address + "', " +
	                     "password = '"+ password +"' " +
	                     "WHERE customer_id = " + customer_id;
	
	        int rs = stmt.executeUpdate(sql);
	
	        if (rs > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	
	    return isSuccess;
	}
	
	public static List<CustomerModel> getById (int customer_Id){
			
			
			ArrayList <CustomerModel> customers = new ArrayList<>();
			
			try {
				
				//DB Connection
				
				con = DBConnection.getInstance().getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from customers where customer_id = " + customer_Id;
				
				rs= stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					int customer_id = rs.getInt("customer_id");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String address = rs.getString("address");
					String created_at = rs.getString("created_at");
					String password = rs.getString("password");
					
					CustomerModel cm = new CustomerModel(customer_id, name, phone, email, address, created_at, password);
					customers.add(cm);
					
				}
			}catch(Exception ex) {
				
				ex.printStackTrace();
			}
			
			return customers;
	}
	
	public static boolean deletdata(int id) {
			
			try {
				
				//DB Connection
				
				con = DBConnection.getInstance().getConnection();
				stmt = con.createStatement();
				
				//SQL query
				
				String sql = "DELETE FROM customers WHERE customer_id = '"+id+"'";
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					
					isSuccess = true;
				}else {
					
					isSuccess = false;
				}
			}catch(Exception ex) {
				
				ex.printStackTrace();
			}
			
			return isSuccess;
		}
}
