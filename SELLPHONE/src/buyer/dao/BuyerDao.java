package buyer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import buyer.model.Buyer;

public class BuyerDao {

	public Buyer selectByBuyer_id(Connection conn, String buyer_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from buyer where buyer_id = ?");
			pstmt.setString(1, buyer_id);
			rs = pstmt.executeQuery();
			Buyer buyer = null;
			if (rs.next()) {
				buyer = new Buyer(
						rs.getString("buyer_id"), 
						rs.getString("buyer_pw"), 
						rs.getString("buyer_name"),
						rs.getString("buyer_address"),
						rs.getString("buyer_phone"),
						rs.getString("buyer_email"),
						toDate(rs.getTimestamp("buyer_joindate"))
						);
			}
			return buyer;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}

	public void insert(Connection conn, Buyer buy) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into buyer values(?,?,?,?,?,?,?)")) {
			pstmt.setString(1, buy.getBuyer_id());
			pstmt.setString(2, buy.getBuyer_pw());
			pstmt.setString(3, buy.getBuyer_name());
			pstmt.setString(4, buy.getBuyer_address());
			pstmt.setString(5, buy.getBuyer_phone());
			pstmt.setString(6, buy.getBuyer_email());
			pstmt.setTimestamp(7, new Timestamp(buy.getBuyer_joindate().getTime()));
			pstmt.executeUpdate();
		}
	}

	public void update(Connection conn, Buyer buyer) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update buyer set buyer_name = ?, buyer_pw = ? where buyer_id = ?")) {
			//id를 찾아서 이름과 비밀번호를 업데이트,주소도 넣을까?
			pstmt.setString(1, buyer.getBuyer_name());
			pstmt.setString(2, buyer.getBuyer_pw());
			pstmt.setString(3, buyer.getBuyer_id());
			pstmt.executeUpdate();
		}
	}

}
