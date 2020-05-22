package seller.service;

import java.sql.Connection;
import java.sql.SQLException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import seller.dao.SellerDao;
import seller.model.Seller;

public class ChangePasswordService {

	private SellerDao sellerDao = new SellerDao();
	
	public void changePassword(String userId, String curPwd, String newPwd) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Seller seller = sellerDao.selectById(conn, userId);
			if (seller == null) {
				throw new MemberNotFoundException();
			}
			if (!seller.matchPassword(curPwd)) {
				throw new InvalidPasswordException();
			}
			seller.changePassword(newPwd);
			sellerDao.update(conn, seller);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
