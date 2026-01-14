package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import utility.DBConnection;


public class InventoryControl {
    // Model class for inventory items
    public static class InventoryItem {
        private int inventoryId;
        private String invantoryName;
        private String invantoryDescription;
        private int quantityAvailable;
        private String category;
        private String stockstatus;
        private String supplierName;
        private Date lastRestockDate;
        private double unitPrice;
        private String storageLocation;
        
        // Constructor
        public InventoryItem(int inventoryId, String invantoryName, String invantoryDescription,
                int quantityAvailable, String category, String stockstatus, String supplierName,
                Date lastRestockDate, double unitPrice, String storageLocation) {
            this.inventoryId = inventoryId;
            this.invantoryName = invantoryName;
            this.invantoryDescription = invantoryDescription;
            this.quantityAvailable = quantityAvailable;
            this.category = category;
            this.stockstatus = stockstatus;
            this.supplierName = supplierName;
            this.lastRestockDate = lastRestockDate;
            this.unitPrice = unitPrice;
            this.storageLocation = storageLocation;
        }
        
        // Getters
        public int getInventoryId() { return inventoryId; }
        public String getInvantoryName() { return invantoryName; }
        public String getInvantoryDescription() { return invantoryDescription; }
        public int getQuantityAvailable() { return quantityAvailable; }
        public String getCategory() { return category; }
        public String getstockstatus() { return stockstatus; }
        public String getSupplierName() { return supplierName; }
        public Date getLastRestockDate() { return lastRestockDate; }
        public double getUnitPrice() { return unitPrice; }
        public String getStorageLocation() { return storageLocation; }
    }

    // Insert method (renamed from insertlaundrey to insertInventory for clarity)
    public static boolean insertInventory(int inventoryId, String invantoryName, String invantoryDescription,
            int quantityAvailable, String category, String stockstatus, String supplierName,
            Date lastRestockDate, double unitPrice, String storageLocation) {

        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnection.getInstance().getConnection();

            String sql = "INSERT INTO invantory (inventoryid, invantoryName,invantory_Description, quantityAvailable, category, stockstatus, supplierName, lastRestockDate, unitPrice, storageLocation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            
            pstmt.setInt(1, inventoryId);
            pstmt.setString(2, invantoryName);
            pstmt.setString(3, invantoryDescription);
            pstmt.setInt(4, quantityAvailable);
            pstmt.setString(5, category);
            pstmt.setString(6, stockstatus);
            pstmt.setString(7, supplierName);
            pstmt.setDate(8, new java.sql.Date(lastRestockDate.getTime()));
            pstmt.setDouble(9, unitPrice);
            pstmt.setString(10, storageLocation);

            
           
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
    
    // New method to get all inventory items
    public static List<InventoryItem> getAllInventoryItems() {
        List<InventoryItem> inventoryList = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.getInstance().getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM invantory";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                int inventoryId = rs.getInt("inventoryid");
                String invantoryName = rs.getString("invantoryName");
                String invantoryDescription = rs.getString("invantory_Description");
                int quantityAvailable = rs.getInt("quantityAvailable");
                String category = rs.getString("category");
                String stockstatus = rs.getString("stockstatus");
                String supplierName = rs.getString("suppliername");
                Date lastRestockDate = rs.getDate("lastRestockdate");
                double unitPrice = rs.getDouble("unitprice");
                String storageLocation = rs.getString("storagelocation");
                
                InventoryItem item = new InventoryItem(
                    inventoryId, invantoryName, invantoryDescription, quantityAvailable,
                    category, stockstatus, supplierName, lastRestockDate, unitPrice, storageLocation
                );
                inventoryList.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return inventoryList;
    }
    
    // Get a specific inventory item by ID
    public static InventoryItem getInventoryById(int inventoryId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        InventoryItem item = null;
        
        try {
            con = DBConnection.getInstance().getConnection();
            String sql = "SELECT * FROM invantory WHERE inventoryid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, inventoryId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String invantoryName = rs.getString("invantoryName");
                String invantoryDescription = rs.getString("invantory_Description");
                int quantityAvailable = rs.getInt("quantityAvailable");
                String category = rs.getString("category");
                String stockstatus = rs.getString("stockstatus");
                String supplierName = rs.getString("suppliername");
                Date lastRestockDate = rs.getDate("lastRestockdate");
                double unitPrice = rs.getDouble("unitprice");
                String storageLocation = rs.getString("storagelocation");
                
                item = new InventoryItem(
                    inventoryId, invantoryName, invantoryDescription, quantityAvailable,
                    category, stockstatus, supplierName, lastRestockDate, unitPrice, storageLocation
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return item;
    }
    
    public static boolean updateInventory(int inventoryid, String invantoryName, String invantoryDescription,
            int quantityAvailable, String category, String stockstatus,
            String suppliername, Date lastRestockDate,
            double unitprice, String storagelocation) {
			boolean isSuccess = false;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
			conn = DBConnection.getInstance().getConnection();
			
			String sql = "UPDATE invantory SET invantoryName=?, invantory_Description=?, quantityAvailable=?, category=?, stockstatus=?, suppliername=?, lastRestockDate=?, unitprice=?, storagelocation=? WHERE inventoryid=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, invantoryName);
			pstmt.setString(2, invantoryDescription);
			pstmt.setInt(3, quantityAvailable);
			pstmt.setString(4, category);
			pstmt.setString(5, stockstatus);
			pstmt.setString(6, suppliername);
			
			java.sql.Date sqlDate = new java.sql.Date(lastRestockDate.getTime());
			pstmt.setDate(7, sqlDate);
			
			pstmt.setDouble(8, unitprice);
			pstmt.setString(9, storagelocation);
			pstmt.setInt(10, inventoryid);
			
			int rowsUpdated = pstmt.executeUpdate();
			isSuccess = rowsUpdated > 0;
			
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			
			return isSuccess;
			}
    
    public static boolean delete(int inventoryid) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isDeleted = false;

        try {
            conn = DBConnection.getInstance().getConnection();
            String sql = "DELETE FROM invantory WHERE inventoryid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, inventoryid);

            int rowsAffected = pstmt.executeUpdate();
            isDeleted = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isDeleted;
    }

  
  
    
}



