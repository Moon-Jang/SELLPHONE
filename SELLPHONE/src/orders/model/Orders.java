package orders.model;

import java.util.Date;

public class Orders {

	private Date orders_date; //주문날짜
	private String orders_amount; //구매 수량
	private BuyWriter buywriter;
	
	public Orders(Date orders_date,String orders_amount,BuyWriter buywriter) {
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

}
