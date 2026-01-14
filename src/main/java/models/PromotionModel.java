package models;

public class PromotionModel {
	
	  private int promo_id;
	  private String promo_code;
	  private String description;
	  private String discount_type;
	  private double value;
	  private String valid_from;
	  private String valid_to;
	  private int usage_limit;
	  private String status;
	  private String created_at;
	  
	public PromotionModel(int promo_id, String promo_code, String description, String discount_type, double value,
			String valid_from, String valid_to, int usage_limit, String status, String created_at) {
		
		
		
		this.promo_id = promo_id;
		this.promo_code = promo_code;
		this.description = description;
		this.discount_type = discount_type;
		this.value = value;
		this.valid_from = valid_from;
		this.valid_to = valid_to;
		this.usage_limit = usage_limit;
		this.status = status;
		this.created_at = created_at;
	}

	public int getPromo_id() {
		return promo_id;
	}

	public void setPromo_id(int promo_id) {
		this.promo_id = promo_id;
	}

	public String getPromo_code() {
		return promo_code;
	}

	public void setPromo_code(String promo_code) {
		this.promo_code = promo_code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDiscount_type() {
		return discount_type;
	}

	public void setDiscount_type(String discount_type) {
		this.discount_type = discount_type;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public String getValid_from() {
		return valid_from;
	}

	public void setValid_from(String valid_from) {
		this.valid_from = valid_from;
	}

	public String getValid_to() {
		return valid_to;
	}

	public void setValid_to(String valid_to) {
		this.valid_to = valid_to;
	}

	public int getUsage_limit() {
		return usage_limit;
	}

	public void setUsage_limit(int usage_limit) {
		this.usage_limit = usage_limit;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_at() {
		return created_at;
	}

	
	  
	
	  

}
