package services;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.Service;
import utility.DBConnection;

public class PricingService {
	
    private Connection con = null;

    public ArrayList<Service> getAllServices() {
        
    	ArrayList<Service> services = new ArrayList<>(); //empty array list to store services
        
        try 
            {
        	con = DBConnection.getInstance().getConnection(); //DB connection
        	String query = "SELECT * FROM services";//get all services query
        	PreparedStatement ps = con.prepareStatement(query);//ps sending question to db to get 
        	ResultSet rs = ps.executeQuery();//holds and lets you read the results.
            while (rs.next()) {
            	
            	//get data and store it in the object
                Service service = new Service();
                service.setService_id(rs.getInt("service_id"));
                service.setService_name(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getDouble("price"));
                service.setCreated_at(rs.getString("created_at"));
                services.add(service);
            }

            return services;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // If there was an error, return nothing
    }

    public Service getServiceById(int service_id) {
        String query = "SELECT * FROM services WHERE service_id = ?";
        Service service = new Service();

        try {
        	
        	con = DBConnection.getInstance().getConnection(); //DB connection
        	PreparedStatement ps = con.prepareStatement(query); //ps sending question to db to get 
            ps.setInt(1, service_id); //holds and lets you read the results.
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                service.setService_id(rs.getInt("service_id"));
                service.setService_name(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getDouble("price"));
                service.setCreated_at(rs.getString("created_at"));
            }

            return service;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
