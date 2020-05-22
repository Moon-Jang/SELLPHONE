package buyer.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import buyer.dao.BuyerDao;
import buyer.model.Buyer;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class JoinService {

	private BuyerDao buyerDao = new BuyerDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Buyer buyer = buyerDao.selectByBuyer_id(conn, joinReq.getBuyer_id());
			if (buyer != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			buyerDao.insert(conn, 
					buyer = new Buyer(
							joinReq.getBuyer_id(), 
							joinReq.getBuyer_pw(), 
							joinReq.getBuyer_name(),
							joinReq.getBuyer_address(),
							joinReq.getBuyer_phone(),
							joinReq.getBuyer_email(),
							new Date())
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
