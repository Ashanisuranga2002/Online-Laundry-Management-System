package models;

public class Services_Model {

	private int service_id;
	private String service_name;
	private String description;
	private String price;
	private String created_at;
	private String duration;
	private String available;
	private String category;
	
	public Services_Model(int service_id, String service_name, String description, String price, String created_at, String duration, String available, String category) {
		super();
		this.service_id = service_id;
		this.service_name = service_name;
		this.description = description;
		this.price = price;
		this.created_at = created_at;
		this.duration = duration;
		this.available = available;
		this.category = category;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public String getService_name() {
		return service_name;
	}

	public void setService_name(String service_name) {
		this.service_name = service_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	
}
