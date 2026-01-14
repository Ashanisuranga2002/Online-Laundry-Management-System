package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.PromotionModel;
import utility.DBConnection;

public class PromotionController {
	
	//DB Connection
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	// Insert Data function
	
	public static boolean insertData(String promo_code, String description, String discount_type, double value, String valid_from, String valid_to, int usage_limit, String status){
		
		isSuccess = false;
		try {
			
			//DB Connection call
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO promotions (promo_code, description, discount_type, value, valid_from, valid_to, usage_limit, status) " +
		             "VALUES ('" + promo_code + "', '" + description + "', '" + discount_type + "', " + value + ", '" + valid_from + "', '" + valid_to + "', " + usage_limit + ", '" + status + "')";
		
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
		
	public static List<PromotionModel> getAllPromotions(){
		
		ArrayList<PromotionModel> promotions = new ArrayList<>();
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			
			//Query
			
			String sql = "select * from promotions";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int promo_id = rs.getInt(1);
				String promo_code = rs.getString(2);
				String description = rs.getString(3);
				String discount_type = rs.getString(4);
				double value = rs.getDouble(5);
				String valid_from = rs.getString(6);
				String valid_to = rs.getString(7);
				int usage_limit = rs.getInt(8);
				String status = rs.getString(9);
				String created_at = rs.getString(10);
				
				PromotionModel pm = new PromotionModel(promo_id, promo_code, description, discount_type, value, valid_from, valid_to, usage_limit, status, created_at);
				promotions.add(pm);
				
			}
				
				
			}catch(Exception ex) {
				
				ex.printStackTrace();
			}
		
		return promotions;
	}
	
	public static boolean updatedata(int promo_id, String promo_code, String description, String discount_type, double value, String valid_from, String valid_to, int usage_limit, String status) {
	    isSuccess = false;

	    try {
	        con = DBConnection.getInstance().getConnection();
	        stmt = con.createStatement();

	        String sql = "UPDATE promotions SET promo_code = '" + promo_code + "', " +
	                     "description = '" + description + "', " +
	                     "discount_type = '" + discount_type + "', " +
	                     "value = " + value + ", " +
	                     "valid_from = '" + valid_from + "', " +
	                     "valid_to = '" + valid_to + "', " +
	                     "usage_limit = " + usage_limit + ", " +
	                     "status = '" + status + "' " +
	                     "WHERE promo_id = " + promo_id;

	        int rs = stmt.executeUpdate(sql);

	        if (rs > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return isSuccess;
	}

	
	public static List<PromotionModel> getById (int promo_id2){
		
		int convertedID = promo_id2;
		
		ArrayList <PromotionModel> promotions = new ArrayList<>();
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from promotions where promo_id = " + convertedID;
			
			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int promo_id = rs.getInt(1);
				String promo_code = rs.getString(2);
				String description = rs.getString(3);
				String discount_type = rs.getString(4);
				double value = rs.getDouble(5);
				String valid_from = rs.getString(6);
				String valid_to = rs.getString(7);
				int usage_limit = rs.getInt(8);
				String status = rs.getString(9);
				String created_at = rs.getString(10);
				
				PromotionModel pm = new PromotionModel(promo_id, promo_code, description, discount_type, value, valid_from, valid_to, usage_limit, status, created_at);
				promotions.add(pm);
				
			}
		}catch(Exception ex) {
			
			ex.printStackTrace();
		}
		
		return promotions;
	}
	
	public static boolean deletdata(int id) {
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			//SQL query
			
			String sql = "DELETE FROM promotions WHERE promo_id = '"+id+"'";
			
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
