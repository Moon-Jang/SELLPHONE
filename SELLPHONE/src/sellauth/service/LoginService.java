package sellauth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import seller.dao.SellerDao;
import seller.model.Seller;

public class LoginService {

	private SellerDao sellerDao = new SellerDao();

	public User login(String id, String password) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Seller seller = sellerDao.selectById(conn, id);
			if (seller == null) {
				throw new LoginFailException();
			}
			if (!seller.matchPassword(password)) {
				throw new LoginFailException();
			}
			return new User(seller.getSeller_id(), seller.getSeller_name());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
