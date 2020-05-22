package orders.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import orders.dao.OrdersDao;
import orders.model.Orders;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class BuyWriteOrdersService {

	private OrdersDao ordersDao = new OrdersDao();

	public Integer buywrite(BuyWriteRequest req) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			Orders orders = toOrders(req);
			Orders savedArticle = ordersDao.insert(conn, orders);
			if (savedArticle == null) {
				throw new RuntimeException("fail to insert article");
			}
		
			conn.commit();

		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

	private Orders toOrders(BuyWriteRequest req) {
		Date now = new Date();
		return new Orders(null, req.getBuywriter(), req.getOrders_amount(), now, now, 0);
	}
}