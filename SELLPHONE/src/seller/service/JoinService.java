package seller.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import seller.model.Seller;
import seller.dao.SellerDao;

public class JoinService {

	private SellerDao sellerDao = new SellerDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Seller seller = sellerDao.selectById(conn, joinReq.getSeller_id());
			if (seller != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			sellerDao.insert(conn, 
					new Seller(
							joinReq.getSeller_id(), 
							joinReq.getSeller_pw(),
							joinReq.getSeller_name(),
							joinReq.getSeller_address(),
							joinReq.getSeller_email(),
							joinReq.getSeller_phone(),
							new Date()
							)
					);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
