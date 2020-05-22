package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import product.dao.ArticleContentDao;
import product.dao.ProductDao;
import product.model.Product;
import product.model.ArticleContent;

public class ReadArticleService {

	private ProductDao productDao = new ProductDao();
	
	public ArticleData getArticle(int articleNum, boolean increaseReadCount) {
		try (Connection conn = ConnectionProvider.getConnection()){
			Product product = productDao.selectById(conn, articleNum);
			if (product == null) {
				throw new ArticleNotFoundException();
			}
			ArticleContent content = contentDao.selectById(conn, articleNum);
			if (content == null) {
				throw new ArticleContentNotFoundException();
			}
			if (increaseReadCount) {
				productDao.increaseReadCount(conn, articleNum);
			}
			return new ArticleData(product, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
