package seller.service;

import java.util.Date;
import java.util.Map;

public class JoinRequest {

	private String seller_id;
	private String seller_pw;
	private String seller_name;
	private String seller_confirmPw;
	private String seller_address;
	private String seller_email;
	private String seller_phone;
	
	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getSeller_pw() {
		return seller_pw;
	}

	public void setSeller_pw(String seller_pw) {
		this.seller_pw = seller_pw;
	}
	
	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_confirmPw() {
		return seller_confirmPw;
	}

	public void setSeller_confirmPw(String seller_confirmPw) {
		this.seller_confirmPw = seller_confirmPw;
	}

	public String getSeller_address() {
		return seller_address;
	}

	public void setSeller_address(String seller_address) {
		this.seller_address = seller_address;
	}

	public String getSeller_email() {
		return seller_email;
	}

	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public boolean isPasswordEqualToConfirm() {
		return seller_pw != null && seller_pw.equals(seller_confirmPw);
	}

	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, seller_id, "seller_id");
		checkEmpty(errors, seller_address, "seller_address");
		checkEmpty(errors, seller_name, "seller_name");
		checkEmpty(errors, seller_email, "seller_email");
		checkEmpty(errors, seller_phone, "seller_phone");
		checkEmpty(errors, seller_pw, "seller_pw");
		checkEmpty(errors, seller_confirmPw, "seller_confirmPw");
		if (!errors.containsKey("seller_confirmPw")) {
			if (!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}

	private void checkEmpty(Map<String, Boolean> errors, 
			String value, String fieldName) {
		if (value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
	}
}
