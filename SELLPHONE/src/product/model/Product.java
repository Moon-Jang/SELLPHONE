package product.model;

import java.util.Date;

public class Product {

	private int product_idx;
	private Producter producter;
	private String product_name;
	private String product_content;
	private String product_image;
	private Integer product_price;
	private String product_state;
	private Date product_date;
	private String product_storage;
	private String product_color;
	
	public Product(Producter producter,String product_name,String product_content,String product_image,
			Integer product_price,String product_state,Date product_date,String product_storage,String product_color)
	{
		//req.getSession().getAttribute("authUserId")
		this.product_name = product_name;
		this.producter =producter;
		this.product_content = product_content;
		this.product_image = product_image;
		this.product_price = product_price;
		this.product_state = product_state;
		this.product_date = product_date;
		this.product_storage = product_storage;
		this.product_color = product_color;		
	}
	
	public int getProduct_idx() {
		return product_idx;
	}
	
	/*
	 * public void setProduct_idx(int product_idx) { this.product_idx = product_idx;
	 * }
	 */
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_name() {
		return product_name;
	}
	public Producter getProducter() {
		return producter;
	}

	public void setProducter(Producter producter) {
		this.producter = producter;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public String getProduct_state() {
		return product_state;
	}
	public void setProduct_state(String product_state) {
		this.product_state = product_state;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public String getProduct_storage() {
		return product_storage;
	}
	public void setProduct_storage(String product_storage) {
		this.product_storage = product_storage;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	
}
