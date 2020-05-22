package buyauth.service;

public class BuyUser {

	private String buyer_id;
	private String buyer_name;

	public BuyUser(String buyer_id, String buyer_name) {
		this.buyer_id = buyer_id;
		this.buyer_name = buyer_name;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

}
