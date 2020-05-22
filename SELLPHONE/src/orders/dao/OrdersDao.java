package orders.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import orders.model.Orders;
import jdbc.JdbcUtil;

public class OrdersDao {
		
		public Orders insert(Connection conn, Orders orders) throws SQLException {
			PreparedStatement pstmt = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				//INSERT INTO ORDERS VALUES(1,'USER1',SYSDATE,1,7000,'165G','파랑');
				//외래키있어야됌.
			pstmt = conn.prepareStatement("insert into orders"
						+ "(orders_date,orders_amount,Buywriter_id)"
						+ "values (?,?,?)");;
				pstmt.setTimestamp(1, toTimestamp(orders.getOrders_date()));
				pstmt.setString(2, orders.getOrders_amount());
				pstmt.setString(3, orders.getBuywriter().getId());
				int insertedCount = pstmt.executeUpdate();
			/* Orders에 데이터를 삽입한다. */
				if (insertedCount > 0) {
					/* rs = stmt.executeQuery("select last_insert_id() from orders"); 
					 가장 최근 주문사항을 확인한다. */
					return orders;
				}
				return null;
		} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(stmt);
				JdbcUtil.close(pstmt);
		}
 		
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	//주문날짜 ? 
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from orders");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
}
