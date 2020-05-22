package orders.service;

import java.util.Date;
import java.util.Map;

import orders.model.BuyWriter;
import orders.model.Orders;

public class BuyWriteRequest {

	private Date orders_date; //주문날짜
	private String orders_amount; //구매 수량
	private BuyWriter buywriter;
	
	public BuyWriteRequest(BuyWriter buywriter,Date orders_date, String orders_amount) {
		this.orders_date = orders_date;
		this.orders_amount = orders_amount;
		this.buywriter = buywriter;
	}

	public Date getOrders_date() {
		return orders_date;
	}
	public void setOrders_date(Date orders_date) {
		this.orders_date = orders_date;
	}

	public String getOrders_amount() {
		return orders_amount;
	}
	public void setOrders_amount(String orders_amount) {
		this.orders_amount = orders_amount;
	}

	public BuyWriter getBuywriter() {
		return buywriter;
	}
	public void setBuywriter(BuyWriter buywriter) {
		this.buywriter = buywriter;
	}



	public void validate(Map<String, Boolean> errors) {
		if (orders_amount == null || orders_amount.trim().isEmpty()) {
			errors.put("order_amount", Boolean.TRUE);
		}
	}
}
