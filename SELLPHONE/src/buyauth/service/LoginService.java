package buyauth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import buyer.dao.BuyerDao;
import buyer.model.Buyer;

public class LoginService {

	private BuyerDao buyerDao = new BuyerDao();

	public BuyUser login(String buyer_id, String buyer_pw) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Buyer buyer = buyerDao.selectByBuyer_id(conn, buyer_id);
			if (buyer == null) {
				throw new LoginFailException();
			}
			if (!buyer.matchPassword(buyer_pw)) {
				throw new LoginFailException();
			}
			return new BuyUser(buyer.getBuyer_id(), buyer.getBuyer_name());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
