package services;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.Order;
import utility.DBConnection;

public class OrderService {
    private Connection con = null;

    public boolean createOrder(Order order) {
    	
       
        try {
        	con = DBConnection.getInstance().getConnection();//DB connection 
        	String sql = "INSERT INTO orders (orderType, weight, instructions, name, mobile, dropDate, pickDate, cost) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";//SQL command insert new row
        	
            PreparedStatement preparedStatement = con.prepareStatement(sql);//prepare the query insert data safely.
            preparedStatement.setInt(1, order.getOrderType());//getting values from order(model) and adds them to query (Encapsulation)
            preparedStatement.setDouble(2, order.getWeight());
            preparedStatement.setString(3, order.getInstructions());
            preparedStatement.setString(4, order.getName());
            preparedStatement.setString(5, order.getMobile());
            preparedStatement.setDate(6, order.getDropDate());
            preparedStatement.setDate(7, order.getPickDate());
            preparedStatement.setDouble(8, order.getPrice());

            int rowsAffected = preparedStatement.executeUpdate();// execute the query
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();//something wrong print error 
        }

        return false;// if order not created 
    }

    public boolean updateOrder(Order order) {
       
        try {
        	con = DBConnection.getInstance().getConnection();//DB connection
        	//update the correct row (?) for each value we want to change
        	String sql = "UPDATE orders SET orderType = ?, weight = ?, instructions = ?, name = ?, mobile = ?, dropDate = ?, pickDate = ?, cost = ? WHERE orderId = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);//prepare the query insert data safely.
            preparedStatement.setInt(1, order.getOrderType());
            preparedStatement.setDouble(2, order.getWeight());
            preparedStatement.setString(3, order.getInstructions());
            preparedStatement.setString(4, order.getName());
            preparedStatement.setString(5, order.getMobile());
            preparedStatement.setDate(6, order.getDropDate());
            preparedStatement.setDate(7, order.getPickDate());
            preparedStatement.setDouble(8, order.getPrice());
            preparedStatement.setInt(9, order.getOrderId());

            //Run the update command in the database
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();// prints error if injection went wrong
        }
        //update error
        return false;
    }

    public boolean deleteOrder(int orderId) {
    	
    
        try {
        	con = DBConnection.getInstance().getConnection();//DB connection
        	String sql = "DELETE FROM orders WHERE orderId = ?";//delete order using id
            PreparedStatement preparedStatement = con.prepareStatement(sql);//prepare the query delete data safely.
            preparedStatement.setInt(1, orderId);//Put the actual orderId into the first blank

            //run the delete command
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
        	//If something goes wrong print the error
            e.printStackTrace();
        }
        //delete failed
        return false;
    }
    //to fetch every order (including its service name) from the database
    public ArrayList<Order> getAllOrders() {
       
    	ArrayList<Order> orders = new ArrayList<>();//Makes an empty array list to store orders
       ;
        try {
        	con = DBConnection.getInstance().getConnection();//Db connection
        	// Joins orders table with services table to get the service name.
        	String sql = "SELECT * FROM orders INNER JOIN services ON orders.orderType = services.service_id";
            PreparedStatement preparedStatement = con.prepareStatement(sql); //prepare the query run safely.
            ResultSet resultSet = preparedStatement.executeQuery();//Run the query and store the results
            while (resultSet.next()) {
                Order order = new Order();//Reads each row, creates new Order object.
                order.setOrderId(resultSet.getInt("orderId"));
                order.setOrderType(resultSet.getInt("orderType"));
                order.setOrderTypeName(resultSet.getString("service_name"));
                order.setWeight(resultSet.getDouble("weight"));
                order.setInstructions(resultSet.getString("instructions"));
                order.setName(resultSet.getString("name"));
                order.setMobile(resultSet.getString("mobile"));
                order.setDropDate(resultSet.getDate("dropDate"));
                order.setPickDate(resultSet.getDate("pickDate"));
                order.setPrice(resultSet.getDouble("cost"));

                orders.add(order);//Adds to the array list.
            }

            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Order getOrderById(int orderId) {
        
        try {
        	con = DBConnection.getInstance().getConnection();
        	//Write the SQL to get one order plus its service name by matching orderId
        	String sql = "SELECT * FROM orders INNER JOIN services ON orders.orderType = services.service_id WHERE orderId = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);//Prepare the SQL so it’s safe to run
            preparedStatement.setInt(1, orderId);// fill the order id
          //Run the query and store the results
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Order order = new Order();
                order.setOrderId(resultSet.getInt("orderId"));
                order.setOrderType(resultSet.getInt("orderType"));
                order.setOrderTypeName(resultSet.getString("service_name"));
                order.setWeight(resultSet.getDouble("weight"));
                order.setInstructions(resultSet.getString("instructions"));
                order.setName(resultSet.getString("name"));
                order.setMobile(resultSet.getString("mobile"));
                order.setDropDate(resultSet.getDate("dropDate"));
                order.setPickDate(resultSet.getDate("pickDate"));
                order.setPrice(resultSet.getDouble("cost"));

                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
