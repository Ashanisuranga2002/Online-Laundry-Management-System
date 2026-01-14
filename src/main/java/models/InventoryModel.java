package models;

import java.util.Date;

public class InventoryModel {
	private int inventoryid;
	private String invantoryName;
	private String invantoryDescription;
	private int quantityAvailable;
	private String category;
	private  String stockstatus;
	private  String suppliername;
	private  Date  lastRestockdate;
	private  double unitprice;
	private String storagelocation;
	
	
	
	public int getInventoryid() {
		return inventoryid;
	}
	public void setInventoryid(int inventoryid) {
		this.inventoryid = inventoryid;
	}
	public String getInvantoryName() {
		return invantoryName;
	}
	public void setInvantoryName(String invantoryName) {
		this.invantoryName = invantoryName;
	}
	public String getInvantoryDescription() {
		return invantoryDescription;
	}
	public void setInvantoryDescription(String invantoryDescription) {
		this.invantoryDescription = invantoryDescription;
	}
	public int getQuantityAvailable() {
		return quantityAvailable;
	}
	public void setQuantityAvailable(int quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStockstatus() {
		return stockstatus;
	}
	public void setStockstatus(String stockstatus) {
		this.stockstatus = stockstatus;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public Date getLastRestockdate() {
		return lastRestockdate;
	}
	public void setLastRestockdate(Date lastRestockdate) {
		this.lastRestockdate = lastRestockdate;
	}
	public double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(double unitprice) {
		this.unitprice = unitprice;
	}
	public String getStoragelocation() {
		return storagelocation;
	}
	public void setStoragelocation(String storagelocation) {
		this.storagelocation = storagelocation;
	}
	public InventoryModel(int inventoryid, String invantoryName, String invantoryDescription, int quantityAvailable,
			String category, String stockstatus, String suppliername, Date lastRestockdate, double unitprice,
			String storagelocation) {
		super();
		this.inventoryid = inventoryid;
		this.invantoryName = invantoryName;
		this.invantoryDescription = invantoryDescription;
		this.quantityAvailable = quantityAvailable;
		this.category = category;
		this.stockstatus = stockstatus;
		this.suppliername = suppliername;
		this.lastRestockdate = lastRestockdate;
		this.unitprice = unitprice;
		this.storagelocation = storagelocation;
	}
	
	
	
	
	
	
	
	
}