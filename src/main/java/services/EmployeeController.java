
package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.EmployeeModel;
import utility.DBConnection;

public class EmployeeController {
	
	//DB Connection
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	// Insert Data function
	
	public static boolean insertData(String name, String role, String contact_number, String email, String shift_timing, String password){
		
		isSuccess = false;
		try {
			
			//DB Connection call
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO employees (name, role, contact_number, email, shift_timing, password) " +
		             "VALUES ('" + name + "', '" + role + "', '" + contact_number + "', '" + email + "', '" + shift_timing + "', '" + password + "')";
		
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
		
	public static List<EmployeeModel> getAllEmployees(){
		
		ArrayList<EmployeeModel> employees = new ArrayList<>();
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			
			//Query
			
			String sql = "select * from employees";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int employee_id = rs.getInt(1);
				String name = rs.getString(2);
				String role = rs.getString(3);
				String contact_number = rs.getString(4);
				String email = rs.getString(5);
				String shift_timing = rs.getString(6);
				String created_at = rs.getString(7);
				String password = rs.getString(8);
				
				EmployeeModel pm = new EmployeeModel(employee_id, name, role, contact_number, email, shift_timing, password, created_at);
				employees.add(pm);
				
			}
				
				
			}catch(Exception ex) {
				
				ex.printStackTrace();
			}
		
		return employees;
	}
	
	public static boolean updatedata(int employee_id, String name, String role, String contact_number, String email, String shift_timing, String password) {
	    isSuccess = false;

	    try {
	        con = DBConnection.getInstance().getConnection();
	        stmt = con.createStatement();

	        String sql = "UPDATE employees SET employee_id = '" + employee_id + "', " +
	                     "name = '" + name + "', " +
	                     "role = '" + role + "', " +
	                     "contact_number = '" + contact_number + "', " +
	                     "email = '" + email + "', " +
	                     "shift_timing = '" + shift_timing + "' ," +
	                     "password = '" + password + "' " +
	                     "WHERE employee_id = " + employee_id;

	        int rs = stmt.executeUpdate(sql);

	        if (rs > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return isSuccess;
	}

	
	public static List<EmployeeModel> getById (int employee_id2){
		
		int convertedID = employee_id2;
		
		ArrayList <EmployeeModel> employees = new ArrayList<>();
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from employees where employee_id = " + convertedID;
			
			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int employee_id = rs.getInt(1);
				String name = rs.getString(2);
				String role = rs.getString(3);
				String contact_number = rs.getString(4);
				String email = rs.getString(5);
				String shift_timing = rs.getString(6);
				String created_at = rs.getString(7);
				String password = rs.getString(8);
				
				EmployeeModel em = new EmployeeModel(employee_id, name, role, contact_number, email, shift_timing, password, created_at);
				employees.add(em);
				
			}
		}catch(Exception ex) {
			
			ex.printStackTrace();
		}
		
		return employees;
	}
	
	public static boolean deletdata(int id) {
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//SQL query
			
			String sql = "DELETE FROM employees WHERE employee_id = '"+id+"'";
			
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
