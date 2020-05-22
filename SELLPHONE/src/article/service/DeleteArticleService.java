package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import article.dao.ArticleDao;
import article.model.Article;
import jdbc.connection.ConnectionProvider;

public class DeleteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	
	public void deleteArticle(int articleNum) throws SQLException {
		
		try (Connection conn = ConnectionProvider.getConnection()){
			System.out.println("del_service");
			articleDao.delete(conn, articleNum);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
}
