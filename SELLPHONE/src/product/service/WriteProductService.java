package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ArticleContentDao;
import product.dao.ProductDao;
import product.model.Product;
import product.model.ArticleContent;

public class WriteProductService {

	private ProductDao productDao = new ProductDao();

	public Integer write(WriteProductRequest req) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			Product product = toProduct(req);
			Product saveProduct = productDao.insert(conn, product);
			if (saveProduct == null) {
				throw new RuntimeException("fail to insert product");
			}
			conn.commit();

			return saveProduct.getProduct_idx();
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

	private Product toProduct(WriteProductRequest req) {
		Date now = new Date();
		System.out.println(req.getProducter().getId());
		return new Product(req.getProducter(),req.getProduct_name(), req.getProduct_content(),
						req.getProduct_image(),Integer.parseInt(req.getProduct_price()),req.getProduct_state(),now,
						req.getProduct_storage(),req.getProduct_color());
	}
}
