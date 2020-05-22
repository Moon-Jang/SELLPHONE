package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import product.model.Product;
import product.model.Producter;
import product.model.Writer;

public class ProductDao {

	public Product insert(Connection conn, Product product) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//insert into product values(PRODUCT_NO.nextval,'test1','testphone','hello','image',10000,'S',sysdate,'64GB','BLACK');
			pstmt = conn.prepareStatement("insert into product values (PRODUCT_NO.nextval,?,?,?,?,?,?,?,?,?,?,null)");
			//pstmt.setInt(1, product.getProduct_idx());
			pstmt.setString(1, product.getProducter().getId());
			pstmt.setString(2, product.getProducter().getName());
			pstmt.setString(3, product.getProduct_name());
			pstmt.setString(4, product.getProduct_content());
			pstmt.setString(5, product.getProduct_image());
			pstmt.setInt(6, product.getProduct_price());
			pstmt.setString(7, product.getProduct_state());
			pstmt.setTimestamp(8, toTimestamp(product.getProduct_date()));
			pstmt.setString(9, product.getProduct_storage());
			pstmt.setString(10, product.getProduct_color());
			
			int insertedCount = pstmt.executeUpdate();
			if (insertedCount > 0) {
				return product;
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

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from product");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Product> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			/*
			SELECT * FROM( SELECT ROWNUM AS RNUM, product.* FROM  product WHERE ROWNUM <= ?) WHERE RNUM > ?;
			*/
			pstmt = conn.prepareStatement(
					"SELECT * FROM( SELECT ROWNUM AS RNUM, product.* FROM  product WHERE ROWNUM <= ?) WHERE RNUM > ?");
			pstmt.setInt(1, 5);
			pstmt.setInt(2, 1);
			rs = pstmt.executeQuery();

			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertProduct(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Product convertProduct(ResultSet rs) throws SQLException {
		return 	new Product(
				new Producter(
				rs.getString("seller_id"),
				rs.getString("seller_name")),
				rs.getString("product_name"),
				rs.getString("product_content"),
				rs.getString("product_image"),
				rs.getInt("product_price"),
				rs.getString("product_state"),
				rs.getDate("product_date"),
				rs.getString("product_storage"),
				rs.getString("product_color")
				);
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	public Product selectById(Connection conn, Product product) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//select * from product where seller_id='test' and product_name = 'testphone2';
			pstmt = conn.prepareStatement(
					"select * from product where seller_id= ? and product_name = ?");
			pstmt.setString(1, product.getProducter().getId());
			pstmt.setString(2, product.getProduct_name());
			rs = pstmt.executeQuery();
			Product p = null;
			if (rs.next()) { 
				p = convertProduct(rs); 
				}
			return p;		 
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void increaseReadCount(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update product set read_cnt = read_cnt + 1 "+
						"where article_no = ?")) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}
	
	public int update(Connection conn, int no, String title) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update product set title = ?, moddate = now() "+
						"where article_no = ?")) {
			pstmt.setString(1, title);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		}
	}
	
	public int delete(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from product where article_no = ?")) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		}
	}
}
