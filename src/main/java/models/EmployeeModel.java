package models;

public class EmployeeModel {
	
	  private int employee_id;
	  private String name;
	  private String role;
	  private String contact_number;
	  private String email;
	  private String shift_timing;
	  private String password;
	  private String created_at;
	  
	  public EmployeeModel(int employee_id, String name, String role, String contact_number, String email,
				String shift_timing, String password, String created_at) {
			
			this.employee_id = employee_id;
			this.name = name;
			this.role = role;
			this.contact_number = contact_number;
			this.email = email;
			this.shift_timing = shift_timing;
			this.password = password;
			this.created_at = created_at;
		}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getShift_timing() {
		return shift_timing;
	}

	public void setShift_timing(String shift_timing) {
		this.shift_timing = shift_timing;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	  
	  
	  

	
	  
	
	  

}
