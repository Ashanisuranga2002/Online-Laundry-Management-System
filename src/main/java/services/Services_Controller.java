package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.Services_Model;
import utility.DBConnection;

public class Services_Controller {

	//Connect database
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Data Insert 
	
	public static boolean insertdata (String service_name, String description, String price, String duration, String available, String category) {
		
		boolean isSuccess = false;
		
		try {
			//DB connection call
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//SQL query 
			String sql = "insert into services (service_name, description, price, duration, available, category) values('"+service_name+"','"+description+"','"+price+"', '"+duration+"', '"+available+"', '"+category+"')";
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
					//create karapu model name eka
	public static List<Services_Model> getByService_id (String Service_id){
		
		int convertedService_id = Integer.parseInt(Service_id);
		
		ArrayList <Services_Model> service = new ArrayList<>();
		
		try {
			//DB connection 
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//Query                     //table name
			String sql = "select * from services where service_id = '"+convertedService_id+"' ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int service_id = rs.getInt(1);
				String service_name = rs.getString(2);
				String description = rs.getString(3);
				String price = rs.getString(4);
				String created_at = rs.getString(5);
				String duration = rs.getString(6);
				String available = rs.getString(7);
				String category = rs.getString(8);
				
				Services_Model sm = new Services_Model(service_id, service_name, description,price,created_at, duration, available,category);
				service.add(sm);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return service;
	}
	
	//getAll (display function)
	public static List<Services_Model> getAllservice(){
		// array list
		ArrayList <Services_Model> services = new ArrayList<>();
		
		//try - return service 
		try {
			//DB connection 
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//Query                     //table name
			String sql = "select * from services ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int service_id = rs.getInt(1);
				String service_name = rs.getString(2);
				String description = rs.getString(3);
				String price = rs.getString(4);
				String created_at = rs.getString(5);
				String duration = rs.getString(6);
				String available = rs.getString(7);
				String category = rs.getString(8);
				
				Services_Model sm = new Services_Model(service_id, service_name, description,price,created_at,duration, available,category);
				services.add(sm);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return services;
	}
	
	//update  data
	public static boolean updatedata(int service_id, String service_name, String description,String price, String duration, String available, String category) {
	try {
		//DB connection 
		con = DBConnection.getInstance().getConnection();
		stmt = con.createStatement();
		
		//SQL Query
		String sql = "UPDATE services SET service_name = '"+service_name+"', description = '"+description+"', price = '"+price+"', duration = '"+duration+"', available = '"+available+"', category = '"+category+"' WHERE service_id = '"+service_id+"'";

		
		int rs = stmt.executeUpdate(sql);
		if(rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
	
  }
	
	//Delete data
	public static boolean deletedata(String Service_id) {
		int convertedService_id = Integer.parseInt(Service_id);
		
		try {
			//DB connection
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			String sql = "delete from services where service_id='"+convertedService_id+"' ";
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
		return isSuccess;
	}
	
}
