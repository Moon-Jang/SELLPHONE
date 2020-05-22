package seller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import seller.model.Seller;
import seller.model.Seller;

public class SellerDao {

	public Seller selectById(Connection conn, String seller_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from Seller where seller_id = ?");
			pstmt.setString(1, seller_id);
			rs = pstmt.executeQuery();
			Seller seller = null;
			if (rs.next()) {
				seller = new Seller(
						rs.getString("seller_id"), 
						rs.getString("seller_pw"), 
						rs.getString("seller_name"),
						rs.getString("seller_address"),
						rs.getString("seller_email"),
						rs.getString("seller_phone"),
						toDate(rs.getTimestamp("seller_joindate"))
					);
			}
			return seller;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}

	public void insert(Connection conn, Seller sel) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into seller values(?,?,?,?,?,?,?)")) {
			pstmt.setString(1, sel.getSeller_id());
			pstmt.setString(2, sel.getSeller_pw());
			pstmt.setString(3, sel.getSeller_name());
			pstmt.setString(4, sel.getSeller_address());
			pstmt.setString(5, sel.getSeller_email());
			pstmt.setString(6, sel.getSeller_phone());
			pstmt.setTimestamp(7, new Timestamp(sel.getSeller_joindate().getTime()));
			pstmt.executeUpdate();
		}
	}

	public void update(Connection conn, Seller seller) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update Seller set name = ?, password = ? where seller_id = ?")) {
			pstmt.setString(1, seller.getSeller_name());
			pstmt.setString(2, seller.getSeller_pw());
			pstmt.setString(3, seller.getSeller_id());
			pstmt.executeUpdate();
		}
	}
}
