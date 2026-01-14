package models;

public class PaymentModel {
	
	  private int payment_id;
	  private int order_id;
	  private double amount;
	  private String status;
	  private String payment_date;
	  private String payment_method;
	  private String created_at;
	  
	  public PaymentModel(int payment_id, int order_id, double amount, String status, String payment_date,
			String payment_method, String created_at) {
		super();
		this.payment_id = payment_id;
		this.order_id = order_id;
		this.amount = amount;
		this.status = status;
		this.payment_date = payment_date;
		this.payment_method = payment_method;
		this.created_at = created_at;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	  
	

	
	  
	
	  

}
