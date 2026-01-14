package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.PaymentModel;
import utility.DBConnection;

public class PaymentController {
	
	//DB Connection
	
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	// Insert Data function
	
	
		
	public static List<PaymentModel> getAllPayments(){
		
		ArrayList<PaymentModel> payments = new ArrayList<>();
		
		try {
			
			//DB Connection
			
			con = DBConnection.getInstance().getConnection();
			stmt = con.createStatement();
			
			
			//Query
			
			String sql = "select * from payments";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int payment_id = rs.getInt(1);
				int order_id = rs.getInt(2);
				double amount = rs.getDouble(3);
				String status = rs.getString(4);
				String payment_date = rs.getString(5);
				String payment_method = rs.getString(6);
				String created_at = rs.getString(7);
				
				PaymentModel pm = new PaymentModel(payment_id, order_id, amount, status, payment_date, payment_method,created_at);
				payments.add(pm);
				
			}
				
				
			}catch(Exception ex) {
				
				ex.printStackTrace();
			}
		
		return payments;
	}
	
	

	
	
	

	
	
	

}
