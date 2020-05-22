package seller.model;
import java.util.Date;

public class Seller {

	private String seller_id;
	private String seller_pw;
	private String seller_name;
	private String seller_address;
	private String seller_email;
	private String seller_phone;
	private Date seller_joindate;
	
	public Seller(String seller_id,String seller_pw,String seller_name,
						String seller_address,String seller_email,String seller_phone,Date seller_joindate) {
		this.seller_id = seller_id;
		this.seller_pw = seller_pw;
		this.seller_name = seller_name;
		this.seller_address = seller_address;
		this.seller_email = seller_email;
		this.seller_phone = seller_phone;
		this.seller_joindate = seller_joindate;
	}
	

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

	public Date getSeller_joindate() {
		return seller_joindate;
	}

	public void setSeller_joindate(Date seller_joindate) {
		this.seller_joindate = seller_joindate;
	}

	public void changePassword(String newPwd) {
		this.seller_pw = newPwd;
	}

	public boolean matchPassword(String pwd) {
		return seller_pw.equals(pwd);
	}

}
