package buyer.model;

import java.util.Date;

public class Buyer {
	
	private String buyer_id;
	private String buyer_pw;
	private String buyer_name;
	private String buyer_address;
	private String buyer_phone;
	private String buyer_email;
	private Date buyer_joindate;
	
	public Buyer(String buyer_id, String buyer_pw, String buyer_name, String buyer_address, String buyer_phone, String buyer_email, Date buyer_joindate) {
		this.buyer_id = buyer_id;
		this.buyer_pw = buyer_pw;
		this.buyer_name = buyer_name;
		this.buyer_address = buyer_address;
		this.buyer_phone = buyer_phone;
		this.buyer_email = buyer_email;
		this.buyer_joindate = buyer_joindate;
	
	}
	
	
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_pw() {
		return buyer_pw;
	}
	public void setBuyer_pw(String buyer_pw) {
		this.buyer_pw = buyer_pw;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_address() {
		return buyer_address;
	}
	public void setBuyer_address(String buyer_address) {
		this.buyer_address = buyer_address;
	}
	public String getBuyer_phone() {
		return buyer_phone;
	}
	public void setBuyer_phone(String buyer_phone) {
		this.buyer_phone = buyer_phone;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public Date getBuyer_joindate() {
		return buyer_joindate;
	}
	public void setBuyer_joindate(Date buyer_joindate) {
		this.buyer_joindate = buyer_joindate;
	}
	public boolean matchPassword(String pwd) {
		return buyer_pw.equals(pwd);
	}

	public void changePassword(String newPwd) {
		this.buyer_pw = newPwd;
	}

}
