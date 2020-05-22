package product.service;

import java.util.Date;
import java.util.Map;
import product.model.Producter;

public class WriteProductRequest {
	private Producter producter;
	private String seller_id;
	private String product_name;
	private String product_content;
	private String product_image;
	private String product_price;
	private String product_state;
	private String product_storage;
	private String product_color;

	public WriteProductRequest(Producter producter,String product_name,String product_content,String product_color,
			String product_image,String product_price,String product_state,String product_storage) {
		this.producter = producter;
		this.product_name = product_name;
		this.product_content = product_content;
		this.product_color = product_color;
		this.product_image = product_image;
		this.product_price = product_price;
		this.product_state = product_state;
		this.product_storage = product_storage;
		
	}

	
	public Producter getProducter() {
		return producter;
	}


	public String getSeller_id() {
		return seller_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public String getProduct_content() {
		return product_content;
	}

	public String getProduct_image() {
		return product_image;
	}

	public String getProduct_price() {
		return product_price;
	}

	public String getProduct_state() {
		return product_state;
	}

	public String getProduct_storage() {
		return product_storage;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void validate(Map<String, Boolean> errors) {
		if (product_name == null || product_name.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
