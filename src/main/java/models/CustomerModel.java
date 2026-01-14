package models;

public class CustomerModel {
		
	  private int customer_id;
	  private String name;
	  private String phone;
	  private String email;
	  private String address;
	  private String password;
	  private String created_at;
	  
	  public CustomerModel(int customer_id, String name, String phone_number, String email, String address,
			String created_at, String password) {
		super();
		this.customer_id = customer_id;
		this.name = name;
		this.phone = phone_number;
		this.email = email;
		this.address = address;
		this.created_at = created_at;
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone_number) {
		this.phone = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	  
	  
	

}
