package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import auth.service.User;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ArticleContentDao;
import product.dao.ArticleDao;
import product.model.Product;

public class DeleteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();

	public void delete(int articleNumber, User authUser) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Product article = articleDao.selectById(conn, articleNumber);
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			if (!canModify(authUser.getId(), article)) {
				throw new PermissionDeniedException();
			}
			articleDao.delete(conn, articleNumber);
			contentDao.delete(conn, articleNumber);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

	private boolean canModify(String modfyingUserId, Product article) {
		return article.getWriter().getId().equals(modfyingUserId);
	}
}
